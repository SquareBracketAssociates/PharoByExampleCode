"
ReceiverMorph new openInWorld.
morph := (DroppedMorph new color: Color blue) openInWorld.
morph position: (morph position + (70@0)).
(DroppedMorph new color: Color green) openInWorld.
"
Class {
	#name : #DroppedMorph,
	#superclass : #Morph,
	#category : #'PBE-Morphic'
}

{ #category : #initialization }
DroppedMorph >> initialize [
	super initialize.
	color := Color blue.
	self position: 250 @ 100
]

{ #category : #'dropping/grabbing' }
DroppedMorph >> rejectDropMorphEvent: anEvent [
	| h |
	h := anEvent hand.
	WorldState addDeferredUIMessage: [ h grabMorph: self ].
	anEvent wasHandled: true
]
