﻿/*
Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
};

CKEDITOR.replace('editor2',
    {
        filebrowserBrowseUrl : '/browser/browse.php?type=Images',
        filebrowserUploadUrl : '/uploader/upload.php?type=Files'
    });