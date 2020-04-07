"
ReceiverMorph new openInWorld;
    bounds: (100@100 corner: 200@200).
EllipseMorph new openInWorld.
"
Class {
	#name : #ReceiverMorph,
	#superclass : #Morph,
	#category : #'PBE-Morphic'
}

{ #category : #initialization }
ReceiverMorph >> initialize [
	super initialize.
	color := Color red.
	bounds := 0 @ 0 extent: 200 @ 200
]

{ #category : #initialization }
ReceiverMorph >> repelsMorph: aMorph event: anEvent [
	^ (self wantsDroppedMorph: aMorph event: anEvent) not
]

{ #category : #initialization }
ReceiverMorph >> wantsDroppedMorph: aMorph event: anEvent [
	^ aMorph color = Color blue
]
