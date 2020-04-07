"
(DieMorph faces: 6) openInWorld.
"
Class {
	#name : #DieMorph,
	#superclass : #BorderedMorph,
	#instVars : [
		'faces',
		'dieValue',
		'isStopped'
	],
	#category : #'PBE-Morphic'
}

{ #category : #'instance creation' }
DieMorph class >> faces: aNumber [
	^ self new faces: aNumber
]

{ #category : #accessing }
DieMorph >> dieValue: aNumber [
	((aNumber isInteger and: [ aNumber > 0 ]) and: [ aNumber <= faces ])
		ifTrue: [
			dieValue := aNumber.
			self changed ]
]

{ #category : #drawing }
DieMorph >> drawDotOn: aCanvas at: aPoint [
	aCanvas
		fillOval: (Rectangle
			center: self position + (self extent * aPoint)
			extent: self extent / 6)
		color: Color black
]

{ #category : #drawing }
DieMorph >> drawOn: aCanvas [
	| theCanvas |
	theCanvas := aCanvas asAlphaBlendingCanvas: 0.5.
	super drawOn: theCanvas.
	(self perform: ('face', dieValue asString) asSymbol)
		do: [:aPoint | self drawDotOn: theCanvas at: aPoint]
]

{ #category : #drawing }
DieMorph >> drawOnNotAlpha: aCanvas [
	super drawOn: aCanvas.
	(self perform: ('face', dieValue asString) asSymbol)
		do: [:aPoint | self drawDotOn: aCanvas at: aPoint]
]

{ #category : #'die dot placement' }
DieMorph >> face1 [
	^ {(0.5 @ 0.5)}
]

{ #category : #'die dot placement' }
DieMorph >> face2 [
	^{0.25@0.25 . 0.75@0.75}
]

{ #category : #'die dot placement' }
DieMorph >> face3 [
	^{0.25@0.25 . 0.75@0.75 . 0.5@0.5}
]

{ #category : #'die dot placement' }
DieMorph >> face4 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75}
]

{ #category : #'die dot placement' }
DieMorph >> face5 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.5@0.5}
]

{ #category : #'die dot placement' }
DieMorph >> face6 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5}
]

{ #category : #'die dot placement' }
DieMorph >> face7 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5 . 0.5@0.5}
]

{ #category : #'die dot placement' }
DieMorph >> face8 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5 . 0.5@0.5 . 0.5@0.25}
]

{ #category : #'die dot placement' }
DieMorph >> face9 [
	^{0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5 . 0.5@0.5 . 0.5@0.25 . 0.5@0.75}
]

{ #category : #accessing }
DieMorph >> faces: aNumber [
	"Set the number of faces"

	((aNumber isInteger and: [ aNumber > 0 ]) and: [ aNumber <= 9 ])
		ifTrue: [ faces := aNumber ]
]

{ #category : #'event handling' }
DieMorph >> handlesMouseDown: anEvent [
	^ true
]

{ #category : #initialization }
DieMorph >> initialize [
	super initialize.
	self extent: 50 @ 50.
	self
		useGradientFill;
		borderWidth: 2;
		useRoundedCorners.
	self setBorderStyle: #complexRaised.
	self fillStyle direction: self extent.
	self color: Color green.
	dieValue := 1.
	faces := 6.
	isStopped := false
]

{ #category : #'event handling' }
DieMorph >> mouseDown: anEvent [
	anEvent redButtonPressed
		ifTrue: [isStopped := isStopped not]
]

{ #category : #'stepping and presenter' }
DieMorph >> step [
	isStopped ifFalse: [self dieValue: (1 to: faces) atRandom]
]

{ #category : #'stepping and presenter' }
DieMorph >> stepTime [
	^ 100
]
