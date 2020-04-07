"
CrossMorph new openInWorld
"
Class {
	#name : #CrossMorph,
	#superclass : #Morph,
	#category : #'PBE-Morphic'
}

{ #category : #'geometry testing' }
CrossMorph >> containsPoint: aPoint [
	| crossHeight crossWidth horizontalBar verticalBar |
	crossHeight := self height / 3.
	crossWidth := self width / 3.
	horizontalBar := self bounds insetBy: 0 @ crossHeight.
	verticalBar := self bounds insetBy: crossWidth @ 0.
	^ (horizontalBar containsPoint: aPoint) or: [ verticalBar containsPoint: aPoint ]
]

{ #category : #drawing }
CrossMorph >> drawOn: aCanvas [
	| crossHeight crossWidth horizontalBar verticalBar |
	crossHeight := self height / 3.
	crossWidth := self width / 3.
	horizontalBar := self bounds insetBy: 0 @ crossHeight.
	verticalBar := self bounds insetBy: crossWidth @ 0.
	aCanvas fillRectangle: horizontalBar color: self color.
	aCanvas fillRectangle: verticalBar color: self color
]

{ #category : #private }
CrossMorph >> horizontalBar [
	| crossHeight |
	crossHeight := self height / 3.
	^ self bounds insetBy: 0 @ crossHeight
]

{ #category : #private }
CrossMorph >> verticalBar [
	| crossWidth |
	crossWidth := self width / 3.
	^ self bounds insetBy: crossWidth @ 0
]
