// Automatically attach a listener to the window onload, to convert the trees
addEvent(window, "load", convertTrees);

// Utility function to add an event listener
function addEvent(o, e, f) {
  if (o.addEventListener) { o.addEventListener(e, f, false); return true; } else if (o.attachEvent) { return o.attachEvent("on" + e, f); } else { return false; }
}

// utility function to set a global variable if it is not already set
function setDefault(name, val) {
  if (typeof(window[name]) == "undefined" || window[name] == null) {
    window[name] = val;
  }
}

// Full expands a tree with a given ID
function expandTree(treeId) {
  var ul = document.getElementById(treeId);
  if (ul == null) { return false; }
  expandCollapseList(ul, nodeOpenClass);
}

// Fully collapses a tree with a given ID
function collapseTree(treeId) {
  var ul = document.getElementById(treeId);
  if (ul == null) { return false; }
  expandCollapseList(ul, nodeClosedClass);
}

// Expands enough nodes to expose an LI with a given ID
function expandToItem(treeId, itemId) {
  var ul = document.getElementById(treeId);
  if (ul == null) { return false; }
  var ret = expandCollapseList(ul, nodeOpenClass, itemId);
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
function expandCollapseList(ul, cName, itemId) {
  if (!ul.childNodes || ul.childNodes.length == 0) { return false; }
  // Iterate LIs
  for (var itemi = 0; itemi < ul.childNodes.length; itemi++) {
    var item = ul.childNodes[itemi];
    if (itemId != null && item.id == itemId) { return true; }
    if (item.nodeName == "LI") {
      // Iterate things in this LI
      var subLists = false;
      for (var sitemi = 0; sitemi < item.childNodes.length; sitemi++) {
        var sitem = item.childNodes[sitemi];
        if (sitem.nodeName == "UL") {
          subLists = true;
          var ret = expandCollapseList(sitem, cName, itemId);
          if (itemId != null && ret) {
            item.className = cName;
            return true;
          }
        }
      }
      if (subLists && itemId == null) {
        item.className = cName;
      }
    }
  }
}

// Search the document for UL elements with the correct CLASS name, then process them
function convertTrees() {
  setDefault("treeClass", "mktree");
  setDefault("nodeClosedClass", "liClosed");
  setDefault("nodeOpenClass", "liOpen");
  setDefault("nodeBulletClass", "liBullet");
  setDefault("nodeLinkClass", "bullet");
  setDefault("preProcessTrees", true);
  if (preProcessTrees) {
    if (!document.createElement) { return; } // Without createElement, we can't do anything
    var uls = document.getElementsByTagName("ul");
    if (uls == null) { return; }
    var uls_length = uls.length;
    for (var uli = 0; uli < uls_length; uli++) {
      var ul = uls[uli];
      if (ul.nodeName == "UL" && ul.className == treeClass) {
        processList(ul);
      }
    }
  }
}

function toggleNode(node) {
  // Due to accessibility (AVT) requirements we need to update the src of the image 
  // based upon the class of the parent (ie open - or closed +)
  if (node.parentNode.className == nodeOpenClass) {
    node.parentNode.className = nodeClosedClass;
    node.firstChild.src = "plus.gif";
  } else {
    node.parentNode.className = nodeOpenClass;
    node.firstChild.src = "minus.gif";
  }

  return false;
}

function setNode(node, open) {
  node.parentNode.className = open ? nodeOpenClass : nodeClosedClass;
  node.firstChild.src = open ? "minus.gif" : "plus.gif";
}

// Process a UL tag and all its children, to convert to a tree
function processList(ul) {
  if (!ul.childNodes || ul.childNodes.length == 0) { return; }
  // Iterate LIs
  for (var itemi = 0; itemi < ul.childNodes.length; itemi++) {
    var item = ul.childNodes[itemi];
    if (item.nodeName == "LI") {
      // Iterate things in this LI
      var subLists = false;
      var content = "";
      for (var sitemi = 0; sitemi < item.childNodes.length; sitemi++) {
        var sitem = item.childNodes[sitemi];
        if (sitem.nodeName == "A" && sitem.classList.contains("category")) {
          // If we find a category, this LI has children and needs to be
          // processed recursively.
          item.classList.add(nodeClosedClass);
          processList(sitem);

          // Setup the category link
          sitem.href = "javascript:void(0);";
          sitem.classList.add("rapi_tree");

          var s = document.createElement("IMG");
          s.src = "plus.gif";
          s.className = "image";

          sitem.insertBefore(s, sitem.firstChild);
          sitem.onclick = function() {
            toggleNode(this);
          }
        }
      }
    }
  }
}