

this package is use for make a search on data which is coming from API or anywhere <br>
<br>
<br>

<img src="assets/img/Screenshot_1695279340.png" alt="img" width="400" height="600">

<br>
<br>


you just have to make a modal json map<br>
<hr style="width:90%;text-align:left;margin-left:0">
make your modal from <br>
https://app.quicktype.io/

<br>
<br>

///function for refresh data in list///<br>

void _runZone(String enteredKeyword) {<br>
List<dynamic> results = [];<br>
if (enteredKeyword.isEmpty) {<br>
results = zoneData;<br>
} else {<br>
results = zoneData<br>
.where((user) => user["name"]// """name""" write a name of your key to make filter<br>
.toLowerCase()<br>
.contains(enteredKeyword.toLowerCase()))<br>
.toList();<br>
}<br>
setState(() {<br>
newZoneData = results;<br>
zoneListStatusMap =<br>
(newZoneData).map<Modal>((de) => Modal.fromMap(de)).toList();//uses modal to refresh data in suggestion list<br>
});<br>
}<br>






