{*
 * $Revision: 16235 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
{if !empty($theme.imageViews)}
{assign var="image" value=$theme.imageViews[$theme.imageViewsIndex]}
{/if}
<table class="width100pc nocellspacing nocellpadding">
  <tr class="alignTop">
    {if !empty($theme.params.sidebarBlocks)}
    <td id="gsSidebarCol">
      {g->theme include="sidebar.tpl"}
    </td>
    {/if}
    <td>
      <div id="gsContent">
        <div class="gbBlock gcBackground1">
          <table class="width100pc">
            <tr>
              <td>
                {if !empty($theme.item.title)}
                <h2> {$theme.item.title|markup} </h2>
                {/if}
                {if !empty($theme.item.description)}
                <p class="giDescription">
                  {$theme.item.description|markup}
                </p>
                {/if}
              </td>
              <td class="width30pc">
                {g->block type="core.ItemInfo"
                          item=$theme.item
                          showDate=true
                          showOwner=$theme.params.showImageOwner
                          class="giInfo"}
                {g->block type="core.PhotoSizes" class="giInfo"}
              </td>
            </tr>
          </table>
        </div>

        {if !empty($theme.navigator)}
        <div class="gbBlock gcBackground2 gbNavigator">
          {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
        </div>
        {/if}

        <div id="gsImageView" class="gbBlock">
          {if !empty($theme.imageViews)}
	    {capture name="fallback"}
	    <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"
			     forceFullUrl=true forceSessionId=true}">
	      {g->text text="Download %s" arg1=$theme.sourceImage.itemTypeName.1}
	    </a>
	    {/capture}

	    {if ($image.viewInline)}
	      {if isset($theme.photoFrame)}
		{g->container type="imageframe.ImageFrame" frame=$theme.photoFrame
			      width=$image.width height=$image.height}
		  {g->image id="%ID%" item=$theme.item image=$image
			    fallback=$smarty.capture.fallback class="%CLASS%"}
		{/g->container}
	      {else}
		{g->image item=$theme.item image=$image fallback=$smarty.capture.fallback}
	      {/if}
	    {else}
	      {$smarty.capture.fallback}
	    {/if}
          {else}
            {g->text text="There is nothing to view for this item."}
          {/if}
        </div>

        {* Download link for item in original format *}
        {if !empty($theme.sourceImage) && $theme.sourceImage.mimeType != $theme.item.mimeType}
        <div class="gbBlock">
          <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}">
            {g->text text="Download %s in original format" arg1=$theme.sourceImage.itemTypeName.1}
          </a>
        </div>
        {/if}

        {* Show any other photo blocks (comments, exif etc) *}
        {foreach from=$theme.params.photoBlocks item=block}
          {g->block type=$block.0 params=$block.1}
        {/foreach}

        {if !empty($theme.navigator)}
        <div class="gbBlock gcBackground2 gbNavigator">
          {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
        </div>
        {/if}

        {g->block type="core.GuestPreview" class="gbBlock"}

        {* Our emergency edit link, if the user removes all blocks containing edit links *}
	{g->block type="core.EmergencyEditItemLink" class="gbBlock" checkBlocks="sidebar,photo"}
      </div>
    </td>
  </tr>
</table>
