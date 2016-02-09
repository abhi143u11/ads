<?php /* Location Search*/
function location(){
			 $aRegions = Region::newInstance()->listAll();
                 if(count($aRegions) >= 0 ) { ?>
              
                <select id="regionId" name="sRegion" class="form-control">
                    <option value=""><?php _e("Select a region..."); ?></option>
                    <?php foreach($aRegions as $region) { ?>
                    <option id="idregioni"  value="<?php echo $region['pk_i_id']; ?>"<?php if(Params::getParam('sRegion') == $region['pk_i_id']) { ?>selected<?php } ?>><?php echo $region['s_name']; ?></option>
                    <?php } ?>
                </select>
               
                <?php } ?>
                 <br />
                 
                <?php $aCities = City::newInstance()->getByRegion($cityId);
				if (count($aCities) >= 0 ) {?>
                
                <select name="sCity" id="cityId" class="form-control"> 
                    <option value=""><?php _e("Select a city..."); ?></option>
                    <?php foreach($aCities as $city) { ?>      
                    <option value="<?php echo $city['pk_i_id']; ?>"<?php if(Params::getParam('sCity') == $city['pk_i_id']) { ?>selected<?php } ?>><?php echo $city['s_name'] ; ?></option>
                    <?php } ?>
                </select>
             
                <?php } ?> 
   


<script>
$(document).ready(function(){
	$("#countryId").live("change",function(){
		var pk_c_code = $(this).val();
		<?php if($path=="admin") { ?>
			var url = '<?php echo osc_admin_base_url(true)."?page=ajax&action=regions&countryId="; ?>' + pk_c_code;
		<?php } else { ?>
			var url = '<?php echo osc_base_url(true)."?page=ajax&action=regions&countryId="; ?>' + pk_c_code;
		<?php }; ?>
		var result = '';

		if(pk_c_code != '') {

			$("#regionId").attr('disabled',false);
			$("#cityId").attr('disabled',true);

			$.ajax({
				type: "POST",
				url: url,
				dataType: 'json',
				success: function(data){
					var length = data.length;
					
					if(length > 0) {

						result += '<option value=""><?php _e("Select a region..."); ?></option>';
						for(key in data) {
							result += '<option value="' + data[key].pk_i_id + '">' + data[key].s_name + '</option>';
						}

						$("#region").before('<select class="form-control" name="regionId" id="regionId" ></select>');
						$("#region").remove();

						$("#city").before('<select class="form-control" name="cityId" id="cityId" ></select>');
						$("#city").remove();
						
						$("#regionId").val("");

					} else {

						$("#regionId").before('<input class="form-control" placeholder="<?php _e("Enter region..."); ?>"type="text" name="region" id="region" />');
						$("#regionId").remove();
						
						$("#cityId").before('<input class="form-control" placeholder="<?php _e("Enter city..."); ?>" type="text" name="city" id="city" />');
						$("#cityId").remove();
						
					}

					$("#regionId").html(result);
					$("#cityId").html('<option selected value=""><?php _e("Select a city..."); ?></option>');
				}
			 });

		 } else {

			 // add empty select
			 $("#region").before('<select name="regionId" class="form-control" id="regionId" ><option value=""><?php _e("Select a region..."); ?></option></select>');
			 $("#region").remove();
			 
			 $("#city").before('<select name="cityId" class="form-control" id="cityId" ><option value=""><?php _e("Select a city..."); ?></option></select>');
			 $("#city").remove();

			 if( $("#regionId").length > 0 ){
				 $("#regionId").html('<option value=""><?php _e("Select a region..."); ?></option>');
			 } else {
				 $("#region").before('<select name="regionId" class="form-control" id="regionId" ><option value=""><?php _e("Select a region..."); ?></option></select>');
				 $("#region").remove();
			 }
			 if( $("#cityId").length > 0 ){
				 $("#cityId").html('<option value=""><?php _e("Select a city..."); ?></option>');
			 } else {
				 $("#city").before('<select name="cityId" class="form-control" id="cityId" ><option value=""><?php _e("Select a city..."); ?></option></select>');
				 $("#city").remove();
			 }
			 $("#regionId").attr('disabled',true);
			 $("#cityId").attr('disabled',true);
		 }
	});

	$("#regionId").live("change",function(){
		var pk_c_code = $(this).val();
		<?php if($path=="admin") { ?>
			var url = '<?php echo osc_admin_base_url(true)."?page=ajax&action=cities&regionId="; ?>' + pk_c_code;
		<?php } else { ?>
			var url = '<?php echo osc_base_url(true)."?page=ajax&action=cities&regionId="; ?>' + pk_c_code;
		<?php }; ?>

		var result = '';

		if(pk_c_code != '') {
			
			$("#cityId").attr('disabled',false);
			$.ajax({
				type: "POST",
				url: url,
				dataType: 'json',
				success: function(data){
					var length = data.length;
					if(length > 0) {
						result += '<option selected value=""><?php _e("Select a city..."); ?></option>';
						for(key in data) {
							result += '<option value="' + data[key].pk_i_id + '">' + data[key].s_name + '</option>';
						}

						$("#city").before('<select class="form-control" name="cityId" id="cityId" ></select>');
						$("#city").remove();
					} else {
						result += '<option value=""><?php _e('No results') ?></option>';
						$("#cityId").before('<input type="text" name="city" id="city" />');
						$("#cityId").remove();
					}
					$("#cityId").html(result);
				}
			 });
		 } else {
			$("#cityId").attr('disabled',true);
		 }
	});

	if( $("#regionId").attr('value') == "")  {
		$("#cityId").attr('disabled',true);
	}

	if($("#countryIds").length != 0) {
		if( $("#countryIds").attr('type').match(/select-one/) ) {
			if( $("#countryIds").attr('value') == "")  {
				$("#regionId").attr('disabled',true);
			}
		}
	}
});
</script>
<?php } ?>
<?php function dd_printpdf() {
if (function_exists("show_printpdf")) {
show_printpdf();
}
}?>
<?php function dd_qrcode() {
if (function_exists("show_qrcode")) {
show_qrcode();
}
}?>
<?php function dd_embedyoutube() {
if (function_exists("youtube_item_detail")) {
youtube_item_detail();
}
}?>
<?php function dd_picupload() {
 if (function_exists("profile_picture_upload")) {
  profile_picture_upload();
     } else {?>
     <img src="http://www.gravatar.com/avatar/<?php echo md5( strtolower( trim( osc_user_email() ) ) ); ?>?s=120&d=<?php echo osc_current_web_theme_url('images/user-default.jpg') ; ?>" class="img-responsive" />
<?php }  }?>
<?php function dd_userpic() {
 if (function_exists("profile_picture_show")) {
  current_user_picture();
     } else {?>
     <img src="http://www.gravatar.com/avatar/<?php echo md5( strtolower( trim( osc_logged_user_email() ) ) ); ?>?s=20&d=<?php echo osc_current_web_theme_url('images/user-default.jpg') ; ?>" />
<?php }  }?>
<?php function dd_commentpic() {
	if (function_exists("profile_picture_show")) {
 		comment_picture_show();
	} else { ?>
    <a href="<?php echo osc_user_public_profile_url(osc_comment_user_id()); ?>"><img class="img-responsive" src="http://www.gravatar.com/avatar/<?php echo md5( strtolower( trim( osc_comment_author_email() ) ) ); ?>?s=60&d=<?php echo osc_current_web_theme_url('images/user-default.jpg') ; ?>" /></a>
<?php }  }?>
<?php function dd_profilepic() {
 if (function_exists("profile_picture_show")) {
  profile_picture_show();
     } else {?>
     <img src="http://www.gravatar.com/avatar/<?php echo md5( strtolower( trim( osc_item_contact_email() ) ) ); ?>?s=80&d=<?php echo osc_current_web_theme_url('images/user-default.jpg') ; ?>" />
<?php }  }?>
<?php function responsive_recaptcha() { ?>
<script type="text/javascript">
 var RecaptchaOptions = {
	theme : 'custom',
	custom_theme_widget: 'responsive_recaptcha'
 };
</script>
<style type="text/css">
#responsive_recaptcha {
  background-color: #b71800;
  padding: 0.5em;
  border-radius: 1em;
  position: relative;
  overflow: auto;
  max-width: 480px;
  font: 13px "Roboto", Helvetica, Arial, sans-serif;
  color: #ffffff;
}
#responsive_recaptcha a {
  color: #ffffff;
  text-decoration: none;
}
#responsive_recaptcha img,
#responsive_recaptcha #recaptcha_image {
  width: 100% !important;
  height: auto !important;
  -webkit-border-radius: 0.5em;
  -moz-border-radius: 0.5em;
  border-radius: 0.5em;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
}
#responsive_recaptcha .solution {
  margin-top: 0.5em;
  padding: 0.5em;
  padding-top: 1em;
  -webkit-border-radius: 0.5em;
  -moz-border-radius: 0.5em;
  border-radius: 0.5em;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  background-color: #fbe098;
  color: #000000;
  display: block;
}
#responsive_recaptcha .solution input {
  display: block;
  width: 100%;
  margin: 0.5em auto;
  -webkit-appereance: none;
  border: 1px solid #f7c236;
  outline: none;
}
#responsive_recaptcha .solution input:focus {
  border-color: #b71800;
}
#responsive_recaptcha .options {
  margin-top: 0.5em;
  -webkit-border-radius: 0.5em;
  -moz-border-radius: 0.5em;
  border-radius: 0.5em;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
}
#responsive_recaptcha .options a {
  background-color: #c5523d;
  display: block;
  padding: 3px 10px;
  border-top: 1px solid #000000;
  border-left: 1px solid #000000;
  border-right: 1px solid #000000;
}
#responsive_recaptcha .options a:first-child {
  border-radius: 0.5em 0.5em 0 0;
}
#responsive_recaptcha .options a:last-child {
  border-radius: 0 0 0.5em 0.5em;
  border-bottom: 1px solid #000000;
}
@media screen and (min-width: 480px) {
  #responsive_recaptcha .solution {
    float: left;
    width: 66%;
    margin-top: 0.5em;
    padding: 1em;
  }
  #responsive_recaptcha .solution input {
    margin: 0.35em auto;
    width: 90%;
  }
  #responsive_recaptcha .options {
    float: right;
    width: 34%;
    padding-left: 0.5em;
  }
}
</style>
<div id="responsive_recaptcha" style="display:none">
	<div id="recaptcha_image"></div>
	<div class="recaptcha_only_if_incorrect_sol" style="color:red"><?php _e("Incorrect, please try again", 'flatter'); ?></div>
	<label class="solution">
		<!--<span class="recaptcha_only_if_image">Type the two words:</span>
		<span class="recaptcha_only_if_audio">Enter the numbers you hear:</span>-->
		<input type="text" id="recaptcha_response_field" class="form-control" placeholder="<?php _e("Enter the words above", 'flatter'); ?>" name="recaptcha_response_field" />
	</label>
	<div class="options">
		<a href="javascript:Recaptcha.reload()" id="icon-reload"><i class="fa fa-refresh"></i>&nbsp;&nbsp;<?php _e("Reload", 'flatter'); ?></a>
		<a class="recaptcha_only_if_image" href="javascript:Recaptcha.switch_type('audio')" id="icon-audio"><i class="fa fa-volume-up"></i>&nbsp;&nbsp;<?php _e("Audio", 'flatter'); ?></a>
		<a class="recaptcha_only_if_audio" href="javascript:Recaptcha.switch_type('image')" id="icon-image"><i class="fa fa-picture-o"></i>&nbsp;&nbsp;<?php _e("Image", 'flatter'); ?></a>
		<a href="javascript:Recaptcha.showhelp()" id="icon-help"><i class="fa fa-info-circle"></i>&nbsp;&nbsp;<?php _e("Help", 'flatter'); ?></a>
	</div>
</div>
<?php } ?>