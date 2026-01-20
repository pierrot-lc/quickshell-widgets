import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: button
    required property LogoutEntry modelData

    display: AbstractButton.IconOnly
    icon.source: modelData.icon
    icon.width: Config.iconSize
    icon.height: Config.iconSize
    icon.color: Config.iconColor

    Layout.preferredWidth: Config.buttonSize
    Layout.preferredHeight: Config.buttonSize

    background: Rectangle {
        color: button.hovered ? Config.buttonHoverColor : Config.buttonColor
        radius: Config.buttonRadius
    }

    onClicked: modelData.exec()
}
