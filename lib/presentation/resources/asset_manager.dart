// images root path
const String imageRootPath = 'assets/images/';
const String iconRootPath = 'assets/icons/';

// icons path
const String tAddIcon = 'ic_add.svg';
const String tInfoIcon = 'ic_info_outline.svg';
const String tSearchIcon = 'ic_search.svg';
const String tEmptyIcon = 'ic_empty.svg';
const String tNotFoundIcon = 'ic_not_found.svg';
const String tBackIcon = 'ic_back.svg';
const String tDeleteIcon = 'ic_delete.svg';
const String tCloseIcon = 'ic_close.svg';
const String tEditIcon = 'ic_edit.svg';
const String tSaveIcon = 'ic_save.svg';
const String tInfoSolidIcon = 'ic_info_solid.svg';
const String tVisibilityIcon = 'ic_visibility.svg';
const String tNoteIcon = 'ic_note.svg';

// images path
const String tEmptyImg = 'ic_empty.png';
const String tAppIconDark = 'app_icon_dark.png';
const String tAppIconWhite = 'app_icon_white.png';

class TAssetManager {
  TAssetManager._();

  static String getIconPath(String path) => iconRootPath + path;
  static String getImagePath(String path) => imageRootPath + path;
}
