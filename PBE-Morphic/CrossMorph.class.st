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
CrossMorph >> handlesMouseDown: anEvent [
	^ true
]

{ #category : #private }
CrossMorph >> horizontalBar [
	| crossHeight |
	crossHeight := (self height / 3) rounded.
	^ self bounds insetBy: 0 @ crossHeight
]

{ #category : #private }
CrossMorph >> verticalBar [
	| crossWidth |
	crossWidth := (self width / 3) rounded.
	^ self bounds insetBy: crossWidth @ 0
]
