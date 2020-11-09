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

  TextField {
      id: targetField
      placeholderText: "Enter target"
      selectByMouse: true
      focus: true
      y: parent.height / 4
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.rightMargin: 40
      anchors.leftMargin: 40
  }

  Row {
      id: timerRow
      x: 75
      y: parent.height * 3 / 4
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
}
