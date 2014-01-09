
# grunt-finalia-sitemap
# https://github.com/finpack/grunt-finalia-sitemap
# Copyright (c) 2014 Michał Gibowski
# Licensed under the MIT license.

module.exports = (grunt) ->

	# Node modules
	path = require 'path'
	fs = require 'fs'
	_ = require 'lodash'

	# Please see the grunt documentation for more information regarding task and
	# helper creation: https://github.com/cowboy/grunt/blob/master/docs/toc.md

	# ==========================================================================
	# 	TASKS
	# ==========================================================================

	grunt.registerTask 'finalia-sitemap', ->		

        # last modified
		lastModified = new Date().toISOString()

		# -----------------------
		# 		Build sitemap index xml
		# -----------------------
		
		sitemapIndexXmlStr = """
<?xml version="1.0" encoding="UTF-8"?>
   <sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
   <sitemap>
      <loc>http://www.finalia.pl/sitemap-home.xml</loc>
      <lastmod>#{lastModified}</lastmod>
   </sitemap>
   <sitemap>
      <loc>http://www.finalia.pl/blog/sitemap.xml</loc>
      <lastmod>#{lastModified}</lastmod>
   </sitemap>
</sitemapindex>

"""

		# Write sitemap index to dist
		sitemapIndexPath = './dist/sitemap.xml'
		grunt.file.write sitemapIndexPath, sitemapIndexXmlStr
		
		grunt.log.writeln 'Sitemap index created successfully'
		
		
		# -----------------------
		# 		Build sitemap xml
		# -----------------------		
		
		sitemapXmlStr = """
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>http://www.finalia.pl/</loc>
	<lastmod>#{lastModified}</lastmod>
	<changefreq>daily</changefreq>
	<priority>1.0</priority>
  </url>
</urlset>

"""

		# Write sitemap index to dist
		sitemapPath = './dist/sitemap-home.xml'
		grunt.file.write sitemapPath, sitemapXmlStr
		grunt.log.writeln 'Sitemap created successfully'		

		grunt.log.writeln 'OK'

		# Return true / false
		if grunt.task.current.errorCount then no else yes

