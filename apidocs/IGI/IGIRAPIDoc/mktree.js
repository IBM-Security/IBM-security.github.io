/******************************************************************************
* IBM Confidential - OCO Source Materials
*
* The source code for this program is not published or otherwise  
* divested of its trade secrets, irrespective of what has been 
* deposited with the U.S. Copyright Office.
*
* Licensed Materials - Property of IBM
* Product ID = 5725-T18
*
* Copyright IBM Corp. 2015
*
* US Government Users Restricted Rights - Use, duplication, or
* disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
*****************************************************************************/
// Automatically attach a listener to the window onload, to convert the trees
addEvent(window,"load",convertTrees);

// Utility function to add an event listener
function addEvent(o,e,f){
	if (o.addEventListener){ o.addEventListener(e,f,false); return true; }
	else if (o.attachEvent){ return o.attachEvent("on"+e,f); }
	else { return false; }
}

// utility function to set a global variable if it is not already set
function setDefault(name,val) {
	if (typeof(window[name])=="undefined" || window[name]==null) {
		window[name]=val;
	}
}

// Full expands a tree with a given ID
function expandTree(treeId) {
	var ul = document.getElementById(treeId);
	if (ul == null) { return false; }
	expandCollapseList(ul,nodeOpenClass);
}

// Fully collapses a tree with a given ID
function collapseTree(treeId) {
	var ul = document.getElementById(treeId);
	if (ul == null) { return false; }
	expandCollapseList(ul,nodeClosedClass);
}

// Expands enough nodes to expose an LI with a given ID
function expandToItem(treeId,itemId) {
	var ul = document.getElementById(treeId);
	if (ul == null) { return false; }
	var ret = expandCollapseList(ul,nodeOpenClass,itemId);
	if (ret) {
		var o = document.getElementById(itemId);
		if (o.scrollIntoView) {
			o.scrollIntoView(false);
		}
	}
}

// Performs 3 functions:
// a) Expand all nodes
// b) Collapse all nodes
// c) Expand all nodes to reach a certain ID
function expandCollapseList(ul,cName,itemId) {
	if (!ul.childNodes || ul.childNodes.length==0) { return false; }
	// Iterate LIs
	for (var itemi=0;itemi<ul.childNodes.length;itemi++) {
		var item = ul.childNodes[itemi];
		if (itemId!=null && item.id==itemId) { return true; }
		if (item.nodeName == "LI") {
			// Iterate things in this LI
			var subLists = false;
			for (var sitemi=0;sitemi<item.childNodes.length;sitemi++) {
				var sitem = item.childNodes[sitemi];
				if (sitem.nodeName=="UL") {
					subLists = true;
					var ret = expandCollapseList(sitem,cName,itemId);
					if (itemId!=null && ret) {
						item.className=cName;
						return true;
					}
				}
			}
			if (subLists && itemId==null) {
				item.className = cName;
			}
		}
	}
}

// Search the document for UL elements with the correct CLASS name, then process them
function convertTrees() {
	setDefault("treeClass","mktree");
	setDefault("nodeClosedClass","liClosed");
	setDefault("nodeOpenClass","liOpen");
	setDefault("nodeBulletClass","liBullet");
	setDefault("nodeLinkClass","bullet");
	setDefault("preProcessTrees",true);
	if (preProcessTrees) {
		if (!document.createElement) { return; } // Without createElement, we can't do anything
        var uls = document.getElementsByTagName("ul");
		if (uls==null) { return; }
		var uls_length = uls.length;
		for (var uli=0;uli<uls_length;uli++) {
			var ul=uls[uli];
			if (ul.nodeName=="UL" && ul.className==treeClass) {
				processList(ul);
			}
		}
	}
}


// Process a UL tag and all its children, to convert to a tree
function processList(ul) {
	if (!ul.childNodes || ul.childNodes.length==0) { return; }
	// Iterate LIs
	for (var itemi=0;itemi<ul.childNodes.length;itemi++) {
		var item = ul.childNodes[itemi];
		if (item.nodeName == "LI") {
			// Iterate things in this LI
			var subLists = false;
			for (var sitemi=0;sitemi<item.childNodes.length;sitemi++) {
				var sitem = item.childNodes[sitemi];
				if (sitem.nodeName=="B") {
					subLists = true;
					processList(sitem);
				}
			}

			// Due to accessibility requirements we need to make the +/- symbols in the tree direct images rather than CSS background images
			var s= document.createElement("IMG");
			s.src = "plus.gif";
			s.className = "image";

			var t= '\u00A0'; // &nbsp;
			if (subLists) {
				// This LI has UL's in it, so it's a +/- node
				if (item.className==null || item.className=="") {
					item.className = nodeClosedClass;
				}
				// If it's just text, make the text work as the link also
				if (item.firstChild.nodeName=="#text") {
					t = t+item.firstChild.nodeValue;
					item.removeChild(item.firstChild);
				}
				s.onclick = function () {

                    // Due to accessibility (AVT) requirements we need to update the src of the image 
                    // based upon the class of the parent (ie open - or closed +)
					if(this.parentNode.className==nodeOpenClass)
					{
						this.parentNode.className =  nodeClosedClass;
						this.src = "plus.gif";
					}
					else
					{
						this.parentNode.className =  nodeOpenClass;
						this.src = "minus.gif";
					}

                    return false;
				}
			}
			else {
				// No sublists, so it's just a bullet node
				item.className = nodeBulletClass;

                // No image so set the element as a span as previous to AVT update
				s= document.createElement("SPAN");
				s.className = nodeLinkClass;
				s.onclick = function () { return false; }
			}
			s.appendChild(document.createTextNode(t));
			item.insertBefore(s,item.firstChild);
		}
	}
}
