function set_all(show) {
  var root = document.getElementById("rapi_root");
  var all = root.getElementsByClassName("rapi_tree");

  for (var i = -1, l = all.length; ++i < l;) {
    setNode(all[i], show);
  }
}

function open_recursive(node) {
  if (node.id == "rapi_root") {
    return;
  } else if (node.nodeName == "LI") {
    setNode(node.firstElementChild, true);
  }
  open_recursive(node.parentNode);
}

function clear_filter() {
  var filterInput = document.getElementById("rapi_filter");
  filterInput.value = "";
  set_all(false);
}

function rapi_filter() {
  var target = document.getElementById("rapi_filter").value.toLowerCase();

  if (target == "") {
    clear_filter();
    return;
  }

  set_all(false);

  var nodes = document.getElementsByClassName("topic");
  for (node in nodes) {
    if (nodes[node].text == undefined) continue;
    if (nodes[node].text.toLowerCase().indexOf(target) != -1) {
      open_recursive(nodes[node].parentNode);
    }
  }
}