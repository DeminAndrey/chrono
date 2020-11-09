import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12


Page {
  id: root
  property alias backgroundColor: backgroundRect.color

  background: Rectangle {
      id: backgroundRect
      color: "white"
  }
}
