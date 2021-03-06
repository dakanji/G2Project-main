<?php

/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2008 Bharat Mediratta
 *
 * This program is free software; you can redistribute it and/or modify it under the terms of
 * the GNU General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program;
 * if not, write to the Free Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
 * Boston, MA  02110-1301, USA.
 */

/**
 * The implementation of the Rearrange module
 *
 * @package Rearrange
 * @author Alan Harder <alan.harder@sun.com>
 * @version $Revision: 18172 $
 */
class RearrangeModule extends GalleryModule {
	public function __construct() {
		global $gallery;

		$this->setId('rearrange');
		$this->setName($gallery->i18n('Rearrange'));
		$this->setDescription(
			$gallery->i18n(
				'Rearrange the order of album items all at once'
			)
		);

		// Update upgrade() as required
		$this->setVersion('2.0.0');
		$this->setRequiredCoreApi(array(8, 0));
		$this->setRequiredModuleApi(array(4, 0));

		$this->_templateVersion = 1;

		$this->setGroup('gallery', $gallery->i18n('Gallery'));
		$this->setCallbacks('getItemLinks|getItemAdminViews');
	}

	/**
	 * Class Loader
	 */
	public static function getMe() {
		static $instance;

		if (!isset($instance)) {
			$instance = new RearrangeModule();
		}

		return $instance;
	}

	/**
	 * @see GalleryModule::getItemLinks
	 */
	public function getItemLinks($items, $wantsDetailedLinks, $permissions, $userId = null) {
		$links   = array();
		$itemIds = array();

		foreach ($items as $item) {
			if ($item->getCanContainChildren()) {
				$itemIds[] = $item->getId();
			}
		}

		if (!empty($itemIds)) {
			/*
			 * This does not obey the acting user id, but that is ok because we only use it to
			 * determine if the link has children.  We are still gated on the acting user id's
			 * permissions.
			 */
			list($ret, $childCounts) = GalleryCoreApi::fetchChildCounts($itemIds);

			if ($ret) {
				return array($ret, null);
			}

			foreach ($itemIds as $itemId) {
				if (isset($wantsDetailedLinks[$itemId])) {
					if (isset($permissions[$itemId]['core.edit'])
						&& !empty($childCounts[$itemId]) && $childCounts[$itemId] > 1
					) {
						$links[$itemId][] = array(
							'text'   => $this->translate('Rearrange Items'),
							'params' => array(
								'view'    => 'core.ItemAdmin',
								'subView' => 'rearrange.RearrangeItems',
								'itemId'  => $itemId,
								'return'  => 1,
							),
						);
					}
				}
			}
		}

		return array(null, $links);
	}

	/**
	 * @see GalleryModule::getItemAdminViews
	 */
	public function getItemAdminViews($item) {
		$views = array();

		if (!$item->getCanContainChildren()) {
			return array(null, $views);
		}

		list($ret, $permissions) = GalleryCoreApi::getPermissions($item->getId());

		if ($ret) {
			return array($ret, null);
		}

		list($ret, $childCounts) = GalleryCoreApi::fetchChildCounts(array($item->getId()));

		if ($ret) {
			return array($ret, null);
		}

		$childCount = empty($childCounts[$item->getId()]) ? 0 : $childCounts[$item->getId()];

		if (isset($permissions['core.edit']) && $childCount > 1) {
			$views[] = array(
				'name' => $this->translate('Rearrange Items'),
				'view' => 'rearrange.RearrangeItems',
			);
		}

		return array(null, $views);
	}
}
