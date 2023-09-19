part of popup;

mixin PopupController {
  set popupPresented(bool value);

  set popupTitle(String value);

  set popupTitleColor(Color value);

  set popupDescription(String value);

  set popupIcon(IconData value);

  set popupIconColor(Color value);

  Future<void> openPopup(
      {required String title,
      required Color titleColor,
      required String description,
      required IconData icon,
      required Color iconColor}) async {
    popupTitle = title;
    popupTitleColor = titleColor;
    popupDescription = description;
    popupIcon = icon;
    popupIconColor = iconColor;
    popupPresented = true;
  }

  Future<void> closePopup() async {
    popupPresented = false;
    popupTitle = '';
    popupTitleColor = Colors.grey;
    popupDescription = '';
    popupIcon = FontAwesomeIcons.question;
    popupIconColor = Colors.grey;
  }
}
