
# grunt-finalia-sitemapindex
# https://github.com/mgibowski/grunt-finalia-sitemapindex
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
		# 		Build xml
		# -----------------------
		
		xmlStr = """
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

		# Write sitemap to root
		sitemapPath = './dist/sitemap.xml'
		grunt.file.write sitemapPath, xmlStr

		grunt.log.writeln 'Sitemap created successfully'
		grunt.log.writeln 'OK'

		# Return true / false
		if grunt.task.current.errorCount then no else yes

