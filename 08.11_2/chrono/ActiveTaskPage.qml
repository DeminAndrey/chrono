import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Extras 1.4


SimplePpage {
  id: activeTaskPage

  property string name: startPage.taskName
  property int w: 300
  property int readyW: 0
  property int percent: readyW * 100 / w

  header: Rectangle {
      height: 50
      color: "transparent"
      Label {
          text: name
          font.pixelSize: 24
          anchors.verticalCenter: parent.verticalCenter
          anchors.horizontalCenter: parent.horizontalCenter
      }
  }

  Label {
      id: perLbl
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottom: statusRec.top
      anchors.bottomMargin: 20
      font.pixelSize: 36
      color: "lightgreen"
      text: percent + "%"
  }

  Rectangle {
      id: statusRec
      radius: 6
      color: "transparent"
      border.color: "lightgray"
      border.width: 2
      width: w
      height: 50
      anchors.centerIn: parent

      Rectangle {
          id: readyRec
          gradient: Gradient {
              GradientStop { position: 0.0; color: "lightgreen" }
              GradientStop { position: 1.0; color: "green" }
          }
          width: readyW
          radius: parent.radius - parent.border.width
          anchors.top: parent.top
          anchors.bottom: parent.bottom
          anchors.left: parent.left
          anchors.topMargin: parent.border.width
          anchors.bottomMargin: parent.border.width
          anchors.leftMargin: parent.border.width
      }
  }

  RoundButton {
      id: stopButton
      signal stop()
      objectName: "stopButton"
      width: 70
      height: 40
      radius: 3
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.top: statusRec.bottom
      anchors.topMargin: 60
      text: "stop"
      font.pixelSize: 16
      onClicked: {
          stop();
          readyW = 0;
          stackView.pop();
          startPage.clearTask();
      }
  }

  Connections {
      target: task
      onPassed: {
          setWidth(passed);
      }
  }

  function setWidth(pass) {
      readyW = w * pass / 60 / 1000 / startPage.limit
  }
}















