# Build the resulting file
xsltproc --xinclude -o public/index.html build-docset.xslt elements.xml

# Build the SQL to populate the docSet.dsidx SQLLite database
xsltproc --xinclude -o sql/docs.sql build-sql.xslt elements.xml
