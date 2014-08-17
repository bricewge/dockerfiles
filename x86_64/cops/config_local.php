<?php
    if (!isset($config))
        $config = array();
  
    /*
     * The directory containing calibre's metadata.db file, with sub-directories
     * containing all the formats.
     * BEWARE : it has to end with a /
     */
    $config['calibre_directory'] = '/mnt/Livres/';
    
    /*
     * Catalog's title
     */
    $config['cops_title_default'] = "Bibliothèque";
    
    /*
     * use URL rewriting for downloading of ebook in HTML catalog
     * See README for more information
     *  1 : enable
     *  0 : disable
     */
    $config['cops_use_url_rewriting'] = "0";

    /*
     *$config['calibre_internal_directory'] = ''; 
     *
     *$config['cops_full_url'] = 'biblio.bricewge.fr'; 
     *
     *$config['cops_x_accel_redirect'] = "X-Accel-Redirect";
     */
