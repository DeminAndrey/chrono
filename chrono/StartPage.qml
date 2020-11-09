import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


SimplePpage {
  id: startPage

  property alias taskName: targetField.text
  property alias limit: timeLimit.value

  function createTask() {
      task.startTask(limit);
      stackView.push(taskPage);
  }

  function toggleToSetTime() {
    timeLimit.enabled = true;
  }

  function clearTask() {
      targetField.text = "";
      switcher.checked = false;
      timeLimit.value = 5;
      timeLimit.enabled = false;
  }

  ColumnLayout {
      anchors.fill: parent
      anchors.margins: 10

      Item {
          height: 50
      }

      TextField {
          id: targetField
          placeholderText: "Enter target"
          selectByMouse: true
          focus: true
          anchors.horizontalCenter: parent.horizontalCenter
          Layout.fillWidth: true
          Layout.leftMargin: 40
          Layout.rightMargin: 40
      }

      Item {
          height: 100
          anchors.centerIn: parent
          Layout.fillWidth: parent

          RoundButton {
              id: startButton
              width: 100
              height: width
              radius: width / 2
              anchors.centerIn: parent
              text: "start"
              font.pixelSize: 32
              onClicked: {
                  createTask();
              }
          }
      }

      RowLayout {
          id: timerRow
          anchors.horizontalCenter: parent.horizontalCenter

          spacing: 50

          Switch {
              id: switcher
              text: "Time limit"
              onToggled: {
                  toggleToSetTime();
              }
          }
          SpinBox {
              id: timeLimit
              value: 5
              stepSize: 1
              enabled: false
          }
      }

      Item {
          height: 30
      }
  }
}
