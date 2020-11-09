import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


ApplicationWindow {
    visible: true
    title: "Chrono"
    maximumWidth : 480
    minimumWidth: 480

    maximumHeight : 650
    minimumHeight:  650

    header: Rectangle {
        height: 50
        color: "lightgray"
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: startPage
    }

    StartPage {
        id: startPage
    }
    ActiveTaskPage {
        id: taskPage
        visible: false
    }
}
