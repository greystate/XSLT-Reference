DOCSET_NAME="XSLT Quick Reference"
ARCHIVE_NAME="XSLT_Quick_Reference"
BUNDLE="dist/$DOCSET_NAME.docset"

# Build the resulting file
echo "Build HTML file"
xsltproc --xinclude -o public/index.html build-docset.xslt elements.xml

# Build the SQL to populate the docSet.dsidx SQLLite database
echo "Build SQL script"
xsltproc --xinclude -o sql/docs.sql build-sql.xslt elements.xml

# Build the Dash DocSet feed XML file
echo "Build Dash DocSet XML feed"
xsltproc -o dist/xslt-quick-reference.xml --stringparam filename "$ARCHIVE_NAME" build-feed.xslt elements.xml

# Backup the existing DocSet (if any)
if [[ -d "$BUNDLE" ]]; then
	rm -rf "$BUNDLE.bak"
	mv "$BUNDLE" "$BUNDLE.bak"
fi

# Create the Docset Folder
mkdir -p "$BUNDLE/Contents/Resources/Documents/"

# Copy the HTML Doc(s)
cp -R build/* "$BUNDLE/Contents/Resources/Documents"

# Copy the Info.plist file
cp "lib/Info.plist" "$BUNDLE/Contents"

# Create the SQLite file + Index
sqlite3 "$BUNDLE/Contents/Resources/docSet.dsidx" "CREATE TABLE searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);"
sqlite3 "$BUNDLE/Contents/Resources/docSet.dsidx" "CREATE UNIQUE INDEX anchor ON searchIndex (name, type, path);"

# Populate the index
sqlite3 "$BUNDLE/Contents/Resources/docSet.dsidx" ".read sql/docs.sql"

# Create the archived Docset file
echo "Create archive"
tar --exclude='.DS_Store' -cvzf "dist/$ARCHIVE_NAME.tgz" "$BUNDLE"

# Clean up
rm -rf "$BUNDLE.bak"

echo "Completed build - don't forget to upload the $ARCHIVE_NAME.tgz and feed (XML) files to xslt.dk/reference as well as all the HTML files"
