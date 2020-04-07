"
CrossMorph new openInWorld

CrossMorph new openInWorld;
   bounds: (0@0 corner: 200@200);
   color: (Color blue alpha: 0.4)
"
Class {
	#name : #CrossMorph,
	#superclass : #Morph,
	#category : #'PBE-Morphic'
}

{ #category : #drawing }
CrossMorph >> containsPoint: aPoint [
	^ (self horizontalBar containsPoint: aPoint) or: [ self verticalBar containsPoint: aPoint ]
]

{ #category : #drawing }
CrossMorph >> drawOn: aCanvas [
	| topAndBottom |
	aCanvas fillRectangle: self horizontalBar color: self color.
	topAndBottom := self verticalBar areasOutside: self horizontalBar.
	topAndBottom do: [ :each | aCanvas fillRectangle: each color: self color ]
]

{ #category : #'event handling' }
CrossMorph >> handleKeystroke: anEvent [
	| keyValue |
	keyValue := anEvent keyValue.
	keyValue = 30	 "up arrow"
		ifTrue: [self position: self position - (0 @ 1)].
	keyValue = 31	 "down arrow"
		ifTrue: [self position: self position + (0 @ 1)].
	keyValue = 29	 "right arrow"
		ifTrue: [self position: self position + (1 @ 0)].
	keyValue = 28	 "left arrow"
		ifTrue: [self position: self position - (1 @ 0)]
]

{ #category : #'event handling' }
CrossMorph >> handlesMouseDown: anEvent [
	^ true
]

{ #category : #'event handling' }
CrossMorph >> handlesMouseOver: anEvent [
	^ true
]

{ #category : #private }
CrossMorph >> horizontalBar [
	| crossHeight |
	crossHeight := (self height / 3) rounded.
	^ self bounds insetBy: 0 @ crossHeight
]

{ #category : #initialization }
CrossMorph >> initialize [
	super initialize.
	self startStepping
]

{ #category : #'event handling' }
CrossMorph >> mouseDown: anEvent [
	anEvent redButtonPressed
		ifTrue: [ self color: Color red ].	"click"
	anEvent yellowButtonPressed
		ifTrue: [ self color: Color yellow ].	"action-click"
	self changed
]

{ #category : #'event handling' }
CrossMorph >> mouseEnter: anEvent [
	anEvent hand newKeyboardFocus: self
]

{ #category : #'event handling' }
CrossMorph >> mouseLeave: anEvent [
	anEvent hand newKeyboardFocus: nil
]

{ #category : #stepping }
CrossMorph >> step [
	(self color diff: Color black) < 0.1
		ifTrue: [ self color: Color red ]
		ifFalse: [ self color: self color darker ]
]

{ #category : #stepping }
CrossMorph >> stepTime [
	^ 100
]

{ #category : #private }
CrossMorph >> verticalBar [
	| crossWidth |
	crossWidth := (self width / 3) rounded.
	^ self bounds insetBy: crossWidth @ 0
]
