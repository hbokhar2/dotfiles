import Quickshell
import QtQuick
import Quickshell.Io
import Quickshell.Hyprland

Scope {
	id: root
	property bool showMenu: false

	Variants {
		model: Quickshell.screens

		PanelWindow {
			id: window

			required property var modelData
			screen: modelData

			color: "transparent"

			anchors { 
				top: true; 
				left: true; 
				right: true 
			}
			margins { 
				left: 11; 
				right: 11; 
				top: 5; 
				bottom: -4 
			}

			implicitHeight: 35

			Rectangle {
				id: rootRectangle
				anchors.fill: parent
				radius: 4
				color: "#1e1e2e"

				// Clock
				Text {
					anchors.centerIn: rootRectangle
					anchors.verticalCenterOffset: 1
					text: Qt.formatDateTime(clock.date, "hh:mm:ss AP")
					color: "white"
					font.bold: true
					font.pointSize: 11
					SystemClock {
						id: clock
						precision: SystemClock.Seconds
					}
				}

				Row {
					id: leftRow
					anchors { 
						left: parent.left; 
						verticalCenter: parent.verticalCenter
						leftMargin: 10
					}
					height: parent.height

					spacing: 8

					Text {
						anchors.verticalCenter: parent.verticalCenter
						text: ""; color: "white"; font.pointSize: 14; font.bold: true
						MouseArea { 
							anchors.fill: parent; 
							onClicked: root.showMenu = !root.showMenu 
						}
					}

					Item {
						id: powerMenuContainer
						width: root.showMenu ? powerMenuRow.implicitWidth : 0
						height: parent.height
						clip: true
						Behavior on width {
							NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
						}

						Row {
							id: powerMenuRow
							anchors.verticalCenter: parent.verticalCenter
							spacing: 8

							Text {
								anchors.verticalCenter: parent.verticalCenter
								text: "Shutdown"; color: "white"
								font.bold: false
								font.pointSize: 8
								MouseArea {
									anchors.fill: parent
									onClicked: { shutdownProc.running = true; root.showMenu = false }
								}

								Process { id: shutdownProc; command: ["systemctl", "poweroff"] }
							}

							Text {
								anchors.verticalCenter: parent.verticalCenter
								text: "Reboot"; color: "white"
								font.bold: false
								font.pointSize: 8
								MouseArea {
									anchors.fill: parent
									onClicked: { rebootProc.running = true; root.showMenu = false }
								}

								Process { id: rebootProc; command: ["systemctl", "reboot"] }
							}

							Text {
								anchors.verticalCenter: parent.verticalCenter
								text: "Logout"; color: "white"
								font.bold: false
								font.pointSize: 8
								MouseArea {
									anchors.fill: parent
									onClicked: { rebootProc.running = true; root.showMenu = false }
								}

								Process { id: logoutProc; command: ["hyprctl", "dispatch", "exit"] }
							}
						}
					}

					//You need to go over this again.
					Rectangle {
						id: workspaceRectangle

						radius: 4
						color: "white"
						height: leftRow.height - 3
						y: 1.5
						implicitWidth: workspaceRow.implicitWidth + 35

						readonly property var wsByMonitor: ({
							"DP-4": [1, 2, 3],
							"DP-3": [4, 5, 6]
						})

						property var wsIds: wsByMonitor[window.screen.name] ?? [1, 2, 3]

						Row {
							id: workspaceRow
							anchors.centerIn: workspaceRectangle
							spacing: 12
							Repeater {
								model: workspaceRectangle.wsIds
								Text {
									required property int modelData 
									property int wsId: modelData
									property var ws: Hyprland.workspaces.values.find(w => w.id === wsId)
									text: {
										const map = {1:"I",2:"II",3:"III",4:"IV",5:"V",6:"VI"}
										return map[wsId] ?? wsId
									}
									font.pointSize: 12
									font.bold: ws?.active ?? false
									color: {
										if (!ws) return "#cccccc"
										if (ws.active) return "black"
										if ((ws.lastIpcObject?.windows ?? 0) > 0) return "#666666"
										return "#bbbbbb"
									}
									MouseArea {
										anchors.fill: parent
										onClicked: Hyprland.dispatch(`workspace ${wsId}`)
									}
								}
							}
						}
					}
				}

				Row {
					id: rightRow

					anchors {
						right: parent.right
						verticalCenter: parent.verticalCenter
					}

				}
			}
		}
	}
}
