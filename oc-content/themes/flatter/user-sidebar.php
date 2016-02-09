<div id="sidebar">
    <div class="profile-section">
    	<?php dd_picupload();?>
    	<h4><?php echo osc_user_name(); ?></h4>
        <span class="pub-profile"><a href="<?php echo osc_user_profile_url(); ?>/<?php echo osc_logged_user_id(); ?>" target="_blank"><?php _e('Public Profile', 'flatter'); ?></a></span>
    </div>
    <div class="widget">
        <div class="wblock user-nav">
            <?php echo osc_private_user_menu( get_user_menu() ); ?>
        </div>
    </div>
    <?php if( osc_get_preference('google_adsense', 'flatter_theme') !== '0') { ?>
    <div class="widget">
        <div class="wblock gadsense">
        	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
            <!-- Responsive -->
            <ins class="adsbygoogle"
                 style="display:block"
                 data-ad-client="<?php echo osc_get_preference("ads_pubid", "flatter_theme"); ?>"
                 data-ad-format="auto"></ins>
            <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
            </script>
        </div>
    </div> 
    <?php } ?>
</div>