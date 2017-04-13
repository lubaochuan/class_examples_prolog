[source](http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse11)
We have the following knowledge base:
```
directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).
```
That is, this knowledge base holds facts about towns it is possible to travel between by taking a direct train. But of course, we can travel further by chaining together direct train journeys. Write a recursive predicate `travelFromTo/2` that tells us when we can travel by train between two towns. For example, when given the query
```
travelFromTo(nancy,saarbruecken).
```
it should reply
```
true
```
