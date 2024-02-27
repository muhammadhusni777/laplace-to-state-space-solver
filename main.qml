import QtQuick 2.12
import QtQuick.Window 2.13
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtQuick 2.15
import QtQuick.Controls 2.15


Window {
	id : root
	width: 600
	maximumWidth : 600
	minimumWidth : width
    height: 650
	maximumHeight : 650
	minimumHeight : height
	title:"membuat windows"
	color : "#062540"
    visible: true
    //flags: Qt.WindowMaximized //Qt.Dialog
	
	property var a_matrix :[]
	property var a_matrix_prev :[]
	
	property var b_matrix :[]
	property var b_matrix_prev :[]
	
	property var c_matrix :[]
	property var c_matrix_prev :[]
	
	
	property var d_matrix :[]
	property var d_matrix_prev :[]
	
	function update_matrix() {
			
			//a_matrix = backend.a_matrix()
			console.log(a_matrix)
			console.log(a_matrix.length)
			
            // Iterasi melalui a_matrix dan tambahkan ke model
            for (var i = 0; i < a_matrix.length; ++i) {
				//console.log(i)
                for (var j = 0; j < a_matrix[i].length; ++j) {
                    matrixModel.append({ "row": i, "col": j, "value": (a_matrix[i][j]).toFixed(2) })
                }
            }
			
			
			for (var i = 0; i < b_matrix.length; ++i) {
                for (var j = 0; j <= (b_matrix[i].length - 1); ++j) {
                    
					matrixModel1.append({ "row": 0, "col": j, "value": b_matrix[i][j] })
					
				}
            }
			
			
			for (var i = 0; i < c_matrix.length; ++i) {
                for (var j = 0; j <= (c_matrix[i].length -1); ++j) {
                    console.log(c_matrix[i].length)
					matrixModel2.append({ "row": i, "col": j, "value": (c_matrix[i][j]).toFixed(2)})
					
				}
            }
			
			
			
			
			
	}
	
	
	
	
	ListModel {
        id: matrixModel

    }
	
	ListModel {
        id: matrixModel1

    }
	
	
	ListModel {
        id: matrixModel2

    }
	
	
	Rectangle{
	anchors.horizontalCenter: parent.horizontalCenter
	x:150
	y:10
	width : 600
	height : 100
	color : "transparent"
	border.width: 2
    border.color: "#04f4fc"
	
	
	
	Text{
	anchors.horizontalCenter: parent.horizontalCenter
	y:10
	text : "Laplace to State Space Solver"
	color : "white"//"#04f8fa"
	font.pixelSize : 25
	font.bold : true
	}
	
	
	Text{
	anchors.horizontalCenter: parent.horizontalCenter
	y:60
	text : "Written by : Muhammad Husni Muttaqin (23223303)"
	color : "white"//"#04f8fa"
	font.pixelSize : 20
	}
	
	
	
    }
	
	
	Rectangle{
	anchors.horizontalCenter: parent.horizontalCenter
	
	y:120
	width : 600
	height : 150
	color : "transparent"
	border.width: 2
    border.color: "#04f4fc"
	
	Text{
	anchors.horizontalCenter: parent.horizontalCenter
	y:5
	text : "Laplace equation"
	color : "white"//"#04f8fa"
	font.pixelSize : 20
	}
	
	Rectangle{
		y : 50
		anchors.horizontalCenter: parent.horizontalCenter
		width :  40 +num1.width + sdot4.width +  num2.width + sdot3.width + num3.width + sdot2.width +num4.width+sdot1.width
		height : 4
		color : "transparent"
	
	TextInput {
		id : num1
		y : 5
        text: "0"
        font.pixelSize: 20
		color : "#04f8fa"//"#04f8fa"
    }
	
	Text {
		id : sdot4
		x : 5 + num1.width
		y : 5 
        text: "s⁴+"
        font.pixelSize: 20
        
		color : "white"//"#04f8fa"
    }
	
	TextInput {
		id : num2
		x : 10 +num1.width + sdot4.width
		y : 5
        text: "0"
        font.pixelSize: 20
		color : "#04f8fa"//"#04f8fa"
    }
	
	Text {
		id : sdot3
		x : 15 + num1.width + num2.width + sdot4.width
		y : 5 
        text: "s³+"
        font.pixelSize: 20
        
		color : "white"//"#04f8fa"
    }
	
	TextInput {
		id : num3
		x : 20 +num1.width + sdot4.width +  num2.width + sdot3.width
		y : 5
        text: "0"
        font.pixelSize: 20
		color : "#04f8fa"//"#04f8fa"
    }
	
	Text {
		id : sdot2
		x : 25 +num1.width + sdot4.width +  num2.width + sdot3.width + num3.width
		y : 5 
        text: "s²+"
        font.pixelSize: 20
		color : "white"//"#04f8fa"
    }
	
	TextInput {
		id : num4
		x : 30 +num1.width + sdot4.width +  num2.width + sdot3.width + num3.width + sdot2.width
		y : 5
        text: "0"
        font.pixelSize: 20
		color : "#04f8fa"//"#04f8fa"
    }
	
	Text {
		id : sdot1
		x : 35 +num1.width + sdot4.width +  num2.width + sdot3.width + num3.width + sdot2.width +num4.width
		y : 5 
        text: "s+"
        font.pixelSize: 20
		color : "white"//"#04f8fa"
    }
	
	
	TextInput {
		id : num5
		x : 40 +num1.width + sdot4.width +  num2.width + sdot3.width + num3.width + sdot2.width +num4.width+sdot1.width
		y : 5
        text: "0"
        font.pixelSize: 20
		color : "#04f8fa"//"#04f8fa"
    }
	
	
	Button{
		x: 300
		y : 10
		text : "clear cache"
		onClicked:{
		backend.clear("yes")
		a_matrix = []
		console.log(a_matrix)
		matrixModel.clear();
		matrixModel1.clear();
		matrixModel2.clear();
		}
	
	
	}
	
	Button{
		x: 300
		y : 60
		text : "Solve !"
		onClicked:{
		matrixModel.clear();
		matrixModel1.clear();
		matrixModel2.clear();
		backend.clear("yes")
		backend.solver(num1.text, num2.text, num3.text, num4.text, num5.text, den1.text, den2.text, den3.text, den4.text, den5.text)
		console.log(a_matrix)
		}
	
	
	}
	
	//s⁴ s³ s² s
	
	}
	
	
	Rectangle{
		anchors.horizontalCenter: parent.horizontalCenter
		
		y:85
		width :  70 +num1.width + sdot4.width +  num2.width + sdot3.width + num3.width + sdot2.width +num4.width+sdot1.width
		height : 2
		color : "transparent"
		border.width: 2
		border.color: "white"
	}
	
	
	Rectangle{
		y : 90
		anchors.horizontalCenter: parent.horizontalCenter
		width : 40 +num1.width + sdot4.width +  num2.width + sdot3.width + num3.width + sdot2.width +num4.width+sdot1.width
		height : 4
		color : "transparent"
		
		TextInput {
		id : den1
		y : 5
        text: "0"
        font.pixelSize: 20
		color : "#04f8fa"//"#04f8fa"
    }
	
	Text {
		id : sepersdot4
		x : 5 + den1.width
		y : 5 
        text: "s⁴+"
        font.pixelSize: 20
        
		color : "white"//"#04f8fa"
    }
	
	TextInput {
		id : den2
		x : 10 +den1.width + sepersdot4.width
		y : 5
        text: "0"
        font.pixelSize: 20
		color : "#04f8fa"//"#04f8fa"
    }
	
	Text {
		id : sepersdot3
		x : 15 + den1.width + den2.width + sepersdot4.width
		y : 5 
        text: "s³+"
        font.pixelSize: 20
        
		color : "white"//"#04f8fa"
    }
	
	TextInput {
		id : den3
		x : 20 +den1.width + sepersdot4.width +  den2.width + sepersdot3.width
		y : 5
        text: "0"
        font.pixelSize: 20
		color : "#04f8fa"//"#04f8fa"
    }
	
	Text {
		id : sepersdot2
		x : 25 +den1.width + sepersdot4.width +  den2.width + sepersdot3.width + den3.width
		y : 5 
        text: "s²+"
        font.pixelSize: 20
		color : "white"//"#04f8fa"
    }
	
	TextInput {
		id : den4
		x : 30 +den1.width + sepersdot4.width +  den2.width + sepersdot3.width + den3.width + sepersdot2.width
		y : 5
        text: "0"
        font.pixelSize: 20
		color : "#04f8fa"//"#04f8fa"
    }
	
	Text {
		id : sepersdot1
		x : 35 +den1.width + sepersdot4.width +  den2.width + sepersdot3.width + den3.width + sepersdot2.width +den4.width
		y : 5 
        text: "s+"
        font.pixelSize: 20
		color : "white"//"#04f8fa"
    }
	
	
	TextInput {
		id : den5
		x : 40 +den1.width + sepersdot4.width +  den2.width + sepersdot3.width + den3.width + sepersdot2.width +den4.width+sepersdot1.width
		y : 5
        text: "0"
        font.pixelSize: 20
		color : "#04f8fa"//"#04f8fa"
    }
	
	}
	
	
	}
	

	
	
	
	Rectangle{
	anchors.horizontalCenter: parent.horizontalCenter
	
	y:280
	width : 600
	height : 280
	color : "transparent"
	border.width: 2
    border.color: "#04f4fc"
	
	Text{
	anchors.horizontalCenter: parent.horizontalCenter
	y:5
	text : "State Space equation"
	color : "white"//"#04f8fa"
	font.pixelSize : 20
	}
	
	
	Text{
	x: 10 
	y:90
	text : "Ẋ(t) = "
	color : "white"//"#04f8fa"
	font.pixelSize : 16
	}
	
	
	
	
	Rectangle {
		x: 100
		y : 45
		height : 100
		width : 220
		color : "transparent"
		border.width : 2
		border.color : "transparent"
		
		Rectangle {
		anchors.fill: parent
		color : "transparent"
	
	Rectangle {
		x: 0
		y : 0
		height : 2
		width : 10
		color : "white"
		border.width : 2
		border.color : "transparent"
		
	}
	
	Rectangle {
		x: 0
		y : 0
		height : gridView.height + (gridView.height*0.25)
		width : 2
		color : "white"
		border.width : 2
		border.color : "transparent"
		
	}
	
	
	Rectangle {
		x: 0
		y : gridView.height + (gridView.height*0.25)
		height : 2
		width : 10
		color : "white"
		border.width : 2
		border.color : "transparent"
		
	}
	
	
	Rectangle {
		x: gridView.width -10
		y : 0
		height : 2
		width : 10
		color : "white"
		border.width : 2
		border.color : "transparent"
		
	}
	
	Rectangle {
		x: gridView.width -10
		y : gridView.height + (gridView.height*0.25)
		height : 2
		width : 11
		color : "white"
		border.width : 2
		border.color : "transparent"
		
	}
	
	Rectangle {
		x: gridView.width
		y : 0
		height : gridView.height + (gridView.height*0.25)
		width : 2
		color : "white"
		border.width : 2
		border.color : "white"
		
	}
	
	GridView {
        id: gridView
        anchors.fill: parent
        model: matrixModel
        cellWidth:  width/(a_matrix.length) // Check if a_matrix is defined before accessing its length property
		cellHeight: height/(a_matrix.length)
        delegate: Rectangle {
            width: gridView.cellWidth
            height: gridView.cellHeight
            border.color: "transparent"
			color : "transparent"
            Text {
                anchors.centerIn: parent
                text:  model.value
				color : "white"
				font.pixelSize : 14
				
            }
        }
    }
	}
		
		
	}
	
	
	
	Text{
	x: 350 
	y:90
	text : "x(t) + "
	color : "white"//"#04f8fa"
	font.pixelSize : 16
	}
	
	
	Rectangle {
		x: 430
		y : 45
		height : 130
		width : 50
		color : "transparent"
		border.width : 2
		border.color : "white"
		
		Rectangle {
		y : -5
		anchors.horizontalCenter: parent.horizontalCenter
		height : parent.height + 5
		width : parent.width  - 17
		color : "#062540"
		
		GridView {
				id: gridView1
				anchors.fill: parent
				model: matrixModel1
				cellWidth:  width/(1) // Check if a_matrix is defined before accessing its length property
				cellHeight: height/(b_matrix.length) 
				delegate: Rectangle {
					width: gridView1.cellWidth
					height: gridView1.cellHeight
					border.color: "transparent"
					color : "transparent"
					Text {
						anchors.centerIn: parent
						text:  model.value
						color : "white"
						font.pixelSize : 14
					}
				}
			}
		}
	}
	
	Text{
	x: 520 
	y:90
	text : "u(t)"
	color : "white"//"#04f8fa"
	font.pixelSize : 16
	}
	
	
	Text{
	id : text_matrix
	x: 10 
	y:190
	text : "y(t) =    [                                          ]  x(t) + [          ] u(t)"
	color : "white"//"#04f8fa"
	font.pixelSize : 16
	}
	
	
	
	
	Rectangle {
		x: 80
		y : 190
		height : 25
		width : 200
		color : "transparent"
		border.width : 2
		border.color : "transparent"
		
		Rectangle {
		anchors.fill: parent
		color : "transparent"
		
		
		GridView {
				id: gridView2
				anchors.fill: parent
				model: matrixModel2
				cellWidth:  width/(c_matrix.length  + 3) // Check if a_matrix is defined before accessing its length property
				cellHeight: height/(1) 
				delegate: Rectangle {
					width: gridView2.cellWidth
					height: gridView2.cellHeight
					border.color: "transparent"
					color : "transparent"
					Text {
						anchors.centerIn: parent
						text:  model.value
						color : "white"
						font.pixelSize : 14
					}
				}
			}
		
		}
		
		
	}
	
	
	Rectangle {
		x: 360 
		y:190
		height : 25
		width : 40
		color : "transparent"
		border.width : 2
		border.color : "transparent"
		
		Text {
						id : d_matrix_text
						anchors.centerIn: parent
						text:  ""
						color : "white"
						font.pixelSize : 14
					}
	}
	
	
	
	
	}
	
	Image{
	x: 420
	y : 560
	width : 180
	height : 90
	source : "stei_itb.png"
	
	}
	
	
	Timer{
			id:guitimer
			interval:500
			repeat: true
			running: true
			onTriggered: {
				
				a_matrix = backend.array_a()
				b_matrix = backend.array_b()
				c_matrix = backend.array_c()
				d_matrix = backend.array_d()
				
				
				if (JSON.stringify(a_matrix) !== JSON.stringify(a_matrix_prev)) {
					console.log("update")
					update_matrix()
				} else {
					
				}
				d_matrix_text.text = backend.array_d().toString();
				a_matrix_prev = a_matrix
				
				//console.log(b_matrix)
			}
	}
	
	
	
	
	
	
}













