# Build the resulting file
xsltproc -o public/index.html build-docset.xslt elements.xml

# Build the SQL to populate the docSet.dsidx SQLLite database
xsltproc -o sql/docs.sql build-sql.xslt elements.xml
