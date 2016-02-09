<?php osc_current_web_theme_path('header.php'); ?>
    
    <?php if( osc_get_preference('pop_enable', 'flatter_theme') != '0') { ?>
    <!-- Modal -->
    <div class="modal fade" id="promo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php _e('Close', 'flatter'); ?></span></button>
                    <h4 class="modal-title" id="myModalLabel"><?php echo osc_get_preference('pop_heading', 'flatter_theme', "UTF-8"); ?></h4>
          </div>
          <div class="modal-body">
            <?php echo osc_get_preference('landing_pop', 'flatter_theme', "UTF-8"); ?>
          </div>
          
        </div>
      </div>
    </div>
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.0/jquery.cookie.min.js"></script>
    <script type="text/javascript">
     $(window).load(function(){
         if ($.cookie('pop') == null) {
             $('#promo').modal('show');
             $.cookie('pop', '1');
         }
     });
    </script>
    <!-- Popup -->
    <?php }?>

    <?php if (function_exists("osc_slider")) { ?>
    	<?php osc_slider(); ?>
        <!-- Slider -->
    <?php } ?>
    
    <div class="container">
    	<div class="row">
        	<div class="col-md-12">
        	<div class="bigsearch">
            	<form action="<?php echo osc_base_url(true); ?>" method="get" class="search nocsrf" <?php /* onsubmit="javascript:return doSearch();"*/ ?>>
                    <input type="hidden" name="page" value="search"/>
                    <input type="text" name="sPattern" id="query" class="input-text" value="" placeholder="<?php echo osc_esc_html(__(osc_get_preference('keyword_placeholder', 'flatter_theme'), 'flatter')); ?>" />
                    <?php osc_goto_first_category(); ?>
                    <?php  if ( osc_count_categories() ) { ?>
                    <select id="sCategory" name="sCategory">
                        <option value=""><?php _e('Select a category', 'flatter'); ?></option>
                        <?php while ( osc_has_categories() ) { ?>
                        <option class="maincat" value="<?php echo osc_category_id() ; ?>"><?php echo osc_category_name(); ?></option>
                            <?php if ( osc_count_subcategories() ) { ?>
								<?php while ( osc_has_subcategories() ) { ?>
                                <option class="subcat" value="<?php echo osc_category_id() ; ?>"><?php echo osc_category_name(); ?></option>
                                <?php } ?>
                            <?php } ?>
                        <?php } ?>
                    </select>
                    <?php //osc_categories_select('sCategory', null, __('Select a category', 'flatter')) ; ?>
                    <?php  } ?>
                   <?php if( osc_get_preference('location_input', 'flatter_theme') == '1') { ?> 
                   <?php $aRegions = Region::newInstance()->listAll(); ?>
					<?php if(count($aRegions) > 0 ) { ?>
                    <select name="sRegion" id="sRegion">
                    	<option value=""><?php _e('Select a region', 'flatter'); ?></option>
                        <?php foreach($aRegions as $region) { ?>
                        <option value="<?php echo $region['s_name'] ; ?>"><?php echo $region['s_name'] ; ?></option>
                        <?php } ?>
                    </select>
                    <?php } ?>
                    <?php } else { ?>
                    <input name="sCity" id="sCity" placeholder="<?php _e('Type a city', 'flatter'); ?>" type="text" />
                    <input name="sRegion" id="sRegion" type="hidden" />
                    <script type="text/javascript">
						$(function() {
							function log( message ) {
								$( "<div/>" ).text( message ).prependTo( "#log" );
								$( "#log" ).attr( "scrollTop", 0 );
							}
					
							$( "#sCity" ).autocomplete({
								source: "<?php echo osc_base_url(true); ?>?page=ajax&action=location",
								minLength: 2,
								select: function( event, ui ) {
									$("#sRegion").attr("value", ui.item.region);
									log( ui.item ?
										"<?php _e('Selected', 'flatter'); ?>: " + ui.item.value + " aka " + ui.item.id :
										"<?php _e('Nothing selected, input was', 'flatter'); ?> " + this.value );
								}
							});
						});
					</script>
                    <?php } ?>
                    <button class="btn btn-default"><i class="fa fa-search fa-lg"></i><?php //_e("Search", 'flatter');?></button>
                </form>
                <span><a href="<?php echo osc_search_url(); ?>" id="#advsrch" class="nav-toggle"><?php _e('Advanced search', 'flatter'); ?> <i class="fa fa-caret-right"></i></a></span>             
            </div>
            </div>
        </div>
    </div>
    <!-- Big Search -->
    
	<?php if( osc_get_preference('position1_enable', 'flatter_theme') != '0') { ?>
    <div id="position_widget"><!------ Home page widget 1--------------------->
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="dd-widget position_1 <?php if( osc_get_preference('position1_hide', 'flatter_theme') != '0') {echo"hidden-xs";}?>">
                        <?php echo osc_get_preference('position1_content', 'flatter_theme', "UTF-8"); ?>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
    
    <div id="sections">
    	<div class="section">
        	<!--<script language="JavaScript" src="http://j.maxmind.com/app/geoip.js"></script>-->
			<?php
				require_once('geoplugin.class.php');
				$geoplugin = new geoPlugin();
                //$ip = $_SERVER['REMOTE_ADDR'];
                //$details = json_decode(file_get_contents("http://ipinfo.io/{$ip}/json"));
				//locate the IP
				$geoplugin->locate();
				
				 
                $ct= $geoplugin->city;
                $rg= $geoplugin->region;
                $cy= $geoplugin->countryName; 
				//echo "$cy";
            ?> 
            <div class="latestbylocation">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                        <h3><?php 
                                if($ct==null) {
                                        if ($rg==null){
                                            if($cy==null){
                                                echo "No listings";
                                            } else { echo "<script language='JavaScript'>document.write(geoip_city());</script>"; }
                                        }else {echo $rg; }
                                    }else {echo  $ct; }
                            ?>
                            <small><a href="#location" data-toggle="modal" data-target="#locationSelect"><?php _e('browse by location', 'flatter'); ?></a></small></h3>
                            <!-- locationSelect -->
                        </div>
                    </div>
        
                    <div class="row">
                        <div class="col-md-12">
                        <div id="owl-latest" class="owl-carousel">
                            <?php
                                /*$ct= $details->city;
                                $rg= $details->region;
                                $cy= $details->country; */
								$ct= $geoplugin->city;
								$rg= $geoplugin->region;
								$cy= $geoplugin->countryName; 
                                if($cy==null) {
                                if ($rg==null){
                                if($ct !=null){
                                osc_query_item('city_name='.$ct);
                                }
                                }else {  osc_query_item('region_name='.$rg); }
                                }else { osc_query_item('country_name='.$cy); }
                                if( osc_count_custom_items() == 0) { 
                            ?>
        
                            <?php } else { ?>
                            
                            <?php while ( osc_has_custom_items() ) { ?>
                            <div class="item wow fadeInUp animated">
                                <div class="list">
                                    <?php if( osc_images_enabled_at_items() ) { ?>
                                    <div class="image">
                                        <div>
                                        <?php if(osc_count_item_resources()) { ?>
                                        <a href="<?php echo osc_item_url(); ?>"><img src="<?php echo osc_resource_preview_url(); ?>" alt="<?php echo osc_item_title(); ?>" class="img-responsive" /></a>
                                        <?php } else { ?>
                                        <a href="<?php echo osc_item_url(); ?>"><img src="<?php echo osc_current_web_theme_url('images/no-image.jpg'); ?>" alt="<?php echo osc_item_title(); ?>" class="img-responsive"></a>
                                        <?php } ?>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    <div class="caption">
                                        <h3><a href="<?php echo osc_item_url(); ?>"><?php echo osc_item_title(); ?></a></h3>
                                        <p class="user"><?php _e('by', 'flatter') ?> <?php if( osc_item_user_id() != null ) { ?><a href="<?php echo osc_user_public_profile_url( osc_item_user_id() ); ?>" ><?php echo osc_item_contact_name(); ?></a><?php } else { ?><?php echo osc_item_contact_name(); ?><?php } ?></p>
                                        <p class="description"><?php echo osc_highlight( strip_tags( osc_item_description() ), 110 ) ; ?></p>
                                        <div class="row">
                                            <div class="col-md-5 col-sm-5 col-xs-5 price">
                                                <?php if( osc_price_enabled_at_items() ) { ?><span><?php echo osc_format_price(osc_item_price()); ?></span><?php } ?>
                                            </div>
                                            <div class="col-md-7 col-sm-7 col-xs-7 location">
                                                <i class="glyphicon glyphicon-map-marker"></i><?php if(osc_item_region()) { ?> <?php echo osc_item_region(); ?><?php } else { ?> <?php echo osc_item_country(); ?><?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                            <?php } ?>
                        </div>
                        </div>        
                    </div><!-- row -->
                </div>
            </div>
            <!-- Listing by Location -->
        </div><!-- Section 1 -->
        <div class="section">
			<?php osc_get_premiums(osc_get_preference('premium_count', 'flatter_theme')); if( osc_count_premiums() >= 1) { ?>
            <div class="featuredlistings">
                <div class="container">
                    <!--<div class="row">
                        <h3><i class="fa fa-fire"></i> <?php //_e('Premium Listings', 'flatter') ; ?></h3>
                    </div>-->
                    <div class="row">
                        <div class="col-md-12">
                        <div id="fuListings" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                
                                <?php while ( osc_has_premiums() ) { ?>
                                <div class="item clearfix">
                                    <div class="col-md-5 col-sm-5">
                                        <?php if( osc_images_enabled_at_items() ) { ?>
                                            <?php if(osc_count_premium_resources()) { ?>
                                            <a href="<?php echo osc_premium_url(); ?>"><img src="<?php echo osc_resource_url(); ?>" alt="<?php echo osc_premium_title(); ?>" class="img-responsive" /></a>
                                            <?php } else { ?>
                                            <a href="<?php echo osc_premium_url(); ?>"><img src="<?php echo osc_current_web_theme_url('images/no-photo.jpg'); ?>" alt="<?php echo osc_premium_title(); ?>" class="img-responsive"></a>
                                            <?php } ?>
                                            <?php } ?>
                                    </div>
                                    <div class="col-md-7 col-sm-7">
                                        <h3><a href="<?php echo osc_premium_url(); ?>"><?php echo osc_premium_title(); ?></a></h3>
                                        <p class="description"><?php echo osc_highlight( strip_tags( osc_premium_description() ), 320 ) ; ?></p>
                                        <p class="premium-price"><?php if( osc_price_enabled_at_items() ) { ?><a href="<?php echo osc_premium_url(); ?>"><span class="price"><?php echo osc_format_premium_price(); ?></span></a><?php } ?> <!--<a href="<?php echo osc_premium_url(); ?>"><i class="fa fa-link"></i> More details</a>--></p>
                                    </div>
                                </div><!-- Item -->
                                <?php } ?>
                                
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div><!-- Section 2 -->
        <div class="section">
        	<div class="maincategory">
            <div class="container">
                <div class="row"><h3><?php _e('Categories', 'flatter') ; ?></h3></div>
                <div class="row mc  wow fadeInUp animated clearfix">
                <?php // RESET CATEGORIES IF WE USED THEN IN THE HEADER ?>
                <?php osc_goto_first_category(); ?>
                <?php if ( osc_count_categories() >= 0 ) { ?>
                <?php while ( osc_has_categories() ) { ?>
                    <div class="col-md-3 col-sm-4 col-xs-6 cating">
                        <div class="catsingle">
                            <div class="pull-left">
                                <i class="<?php echo osc_esc_html( osc_get_preference('cat_icon_'.osc_category_id(), 'flatter_theme') ); ?> fa-2x"></i>
                            </div>
                            <div class="category">
                                <a class="<?php echo osc_category_slug(); ?>" href="<?php echo osc_search_category_url() ; ?>">
                                <h4><?php echo osc_category_name() ; ?></h4>
                                <p><?php echo osc_category_description(); ?></p>
                                <?php if ( osc_count_subcategories() > 0 ) { ?>
                                </a>
                                <ul>
                                <?php while ( osc_has_subcategories() ) { ?>
                                    <?php if( osc_category_total_items() >= 0 ) { ?>
                                        <li><a class="<?php echo osc_category_slug(); ?>" href="<?php echo osc_search_category_url() ; ?>"><?php echo osc_category_name() ; ?> (<?php echo osc_category_total_items() ; ?>)</a></li>
                                    <?php } ?>
                                <?php } ?>
                                </ul>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <?php } ?>
                </div>
                
				<?php if( osc_get_preference('position2_enable', 'flatter_theme') != '0') { ?>
                <div id="position_widget"><!------ Home page widget 2--------------------->
                    <div class="row">
                        <div class="dd-widget position_2 <?php if( osc_get_preference('position2_hide', 'flatter_theme') != '0') {echo"hidden-xs";}?>">
                            <?php echo osc_get_preference('position2_content', 'flatter_theme', "UTF-8"); ?>
                        </div>  
                     </div>
                </div>
                <?php } ?>
                
            </div><!--row-->
        </div>
        </div><!-- Section 3 -->
        <div class="section">
        	<div class="latestListing">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                    <h3><!--<i class="fa fa-bullhorn hidden-xs"></i> --><?php _e('Latest listings', 'flatter') ; ?></h3>
                </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                    <div id="owl-popular" class="owl-carousel">
                        <?php
                        if( osc_count_latest_items() == 0) { ?>
                            <?php _e('No listings', 'flatter'); ?>
                        <?php } else { ?>
                        <?php while ( osc_has_latest_items() ) { ?>
                        <div class="item wow fadeInUp animated">
                            <div class="list">
                                <?php if( osc_images_enabled_at_items() ) { ?>
                                <div class="image">
                                    <div>
                                    <?php if(osc_count_item_resources()) { ?>
                                    <a href="<?php echo osc_item_url(); ?>"><img src="<?php echo osc_resource_preview_url(); ?>" alt="<?php echo osc_item_title(); ?>" class="img-responsive" /></a>
                                    <?php } else { ?>
                                    <a href="<?php echo osc_item_url(); ?>"><img src="<?php echo osc_current_web_theme_url('images/no-image.jpg'); ?>" alt="<?php echo osc_item_title(); ?>" class="img-responsive"></a>
                                    <?php } ?>
                                    </div>
                                </div>
                                <?php } ?>
                                <div class="caption">
                                    <h3><a href="<?php echo osc_item_url(); ?>"><?php echo osc_item_title(); ?></a></h3>
                                    <p class="user"><?php _e('by', 'flatter') ?> <?php if( osc_item_user_id() != null ) { ?><a href="<?php echo osc_user_public_profile_url( osc_item_user_id() ); ?>" ><?php echo osc_item_contact_name(); ?></a><?php } else { ?><?php echo osc_item_contact_name(); ?><?php } ?></p>
                                    <p class="description"><?php echo osc_highlight( strip_tags( osc_item_description() ), 110 ) ; ?></p>
                                    <div class="row">
                                        <div class="col-md-5 col-sm-5 col-xs-5 price">
                                            <?php if( osc_price_enabled_at_items() ) { ?><span><?php echo osc_format_price(osc_item_price()); ?></span><?php } ?>
                                        </div>
                                        <div class="col-md-7 col-sm-7 col-xs-7 location">
                                            <i class="glyphicon glyphicon-map-marker"></i><?php if(osc_item_region()) { ?> <?php echo osc_item_region(); ?><?php } else { ?> <?php echo osc_item_country(); ?><?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                        <?php } ?>
                    </div><!-- owl carousel -->
                    </div>
                </div><!-- row -->
            </div>
        </div>
        </div><!-- Section 4 -->
        <div class="section">
        	<div class="postadspace">
                <div class="container">
                    <h2><?php echo osc_get_preference("fpromo_text", "flatter_theme"); ?></h2>
                    <p><?php _e("Over", 'flatter');?> <strong><?php echo osc_total_active_items(); ?> <?php _e("Ads", 'flatter');?></strong> <?php _e("listed in", 'flatter');?> <strong><?php echo osc_count_list_cities(); ?> <?php _e("Cities", 'flatter');?></strong>.</p>
                    <?php if( osc_users_enabled() || ( !osc_users_enabled() && !osc_reg_user_post() )) { ?>
                        <a class="btn btn-success btn-lg" href="<?php echo osc_item_post_url() ; ?>"><?php _e("Publish your ad for free", 'flatter');?></a>
                    <?php } ?>
                </div>
            </div>
        </div><!-- Section 5 -->
    </div>

<?php osc_current_web_theme_path('locationfind.php'); ?>
<?php osc_current_web_theme_path('footer.php') ; ?>