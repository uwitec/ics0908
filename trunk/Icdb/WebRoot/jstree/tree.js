var getE = function(id) {
	return document.getElementById(id);
};

function StringBuffer(str) {
	this.strings = new Array;
	if (null != str) {
		this.strings.push(str);
	}
}
StringBuffer.prototype.append = function(str) {
	this.strings.push(str);
	return this;
};
StringBuffer.prototype.toString = function() {
	return this.strings.join("");
};
StringBuffer.prototype.clear = function() {
	this.strings.length = 0;
};

Tree.ULF = 'ul_';
Tree.ITEM_FLAG = 'item_';
Tree.arr = {};
Tree.arrIndex = 0;
/**
 * @param id
 *            树的唯一标识
 * @param className
 *            样式名称
 */
function Tree(id, className) {
	this.id = id;
	this.root = this.id + "_0";
	this.currNode = this.root;
	this.className = className || '';
	this.maxLoop = 1000;
	this.depth = 3;
	this.oldNode = '';
}
/**
 * @param id
 *            树的唯一标识
 * @param className
 *            样式名称
 * @param bReplace
 *            如果有相同标识树存在，是否替换现有树
 * @return 一个tree实例
 */
Tree.createTree = function(id, className, bReplace) {
	var nTree = Tree.arr[id];
	bReplace = null == bReplace ? true : bReplace;
	if (null == nTree || bReplace) {
		Tree.arr[id] = null;
		nTree = new Tree(id, className);
		Tree.arr[id] = nTree;
		nTree._init();
	}
	return nTree;
};
/**
 * 
 * @param id
 *            树的唯一标识
 * @param plus
 *            展开图标路径
 * @param minus
 *            折叠图标路径
 * @param className
 *            样式名称
 * @param bReplace
 *            是否替换现有树
 * @return
 * @deprecated 已过时,参看Tree.createTree
 */
Tree.create = function(id, plus, minus, className, bReplace) {
	Tree.createTree(id, className, bReplace);
};
Tree.prototype._init = function() {
	var oT = getE(this.id);
	// 重置最大递归数（防止死循环）
	this.maxLoop = 1000;
	if (null != oT) {
		oT.className = this.className;
		this._setTree(oT);
	}
};
/**
 * 将页面代码初始化为一棵树,该方法进行递归调用遍历所有的节点。
 * 
 * @param o
 *            节点
 * @param pId
 *            父节点
 * @return
 */
Tree.prototype._setTree = function(o, pId) {

	if (0 >= this.maxLoop--) {
		return;
	}

	var cId = ('LI' == o.tagName ? o.id : pId) || this.id;
	o = o.firstChild;
	var i = 0;
	var max = 300;
	do {
		var tn = o.tagName;
		if ('UL' == tn) {
			// o.className = this.className;
			o.id = Tree.ULF + cId;
		} else if ('LI' == tn) {
			// o.className = this.className;
			o.id = (cId) + '_' + i++;
			var iSub = o.innerHTML.indexOf('<ul');
			if (iSub < 0) {
				iSub = o.innerHTML.indexOf('<UL');
			}
			var sbf = new StringBuffer();
			sbf.append('<span id="').append(Tree.ITEM_FLAG);
			sbf.append(o.id);
			sbf.append('" class="');
			if (iSub >= 0) {
				sbf.append("open");
			} else {
				sbf.append("leef");
			}
			sbf.append('" onclick="Tree.hotClick(\'');
			sbf.append(o.id).append('\',\'');
			sbf.append(this.id).append('\')"><span onclick="Tree.click(\'');
			sbf.append(o.id).append('\',\'');
			sbf.append(this.id).append('\')" class="padding"></span>');
			if (iSub >= 0) {
				sbf.append(o.innerHTML.substring(0, iSub));
				sbf.append('</span>');
				sbf.append(o.innerHTML.substring(iSub));
			} else {
				sbf.append(o.innerHTML).append('</span>');
			}
			o.innerHTML = sbf.toString();
			sbf = null;
		} else {
			continue;
		}
		this._setTree(o, cId);
	} while (null != (o = o.nextSibling) && max-- > 0);
};
/**
 * 判断当前节点是否是根节点。
 * 
 * @return true表是当前节点是根节点。
 */
Tree.prototype.isRoot = function() {
	return this.root == this.currNode;
};
/**
 * 设置树的深度
 * 
 * @param d
 * @return
 */
Tree.setDepth = function(d) {
	Tree.depth = d || 3;
};
/**
 * 节点单击事件
 * 
 * @param id
 *            节点ID
 * @param treeId
 *            树ID
 * @return
 */
Tree.click = function(id, treeId) {
	Tree.openClose(id, treeId, 2);
};
Tree.hotClick = function(id, treeId) {
	Tree.openClose(id, treeId, 2, true);
};
/**
 * 展开或闭合节点
 * 
 * @param sNodeId
 *            节点ID
 * @param sTreeId
 *            树ID
 * @param iState
 *            状态，0：闭合，1：关闭，2：根据节点当前状态来展开或闭合节点
 * @param bHot
 *            如果为true,则只改变节点样式，但不折叠节点
 * @return
 */
Tree.openClose = function(sNodeId, sTreeId, iState, bHot) {
	var uid = Tree.ULF + sNodeId;
	var imgId = Tree.ITEM_FLAG + sNodeId;
	Tree.arr[sTreeId].currNode = sNodeId;

	// 如果前次选中的是叶子（根节点），就修改前次选中节点样式。
	if (2 == iState) {
		if ('' != Tree.arr[sTreeId].oldNode) {
			var oOldNode = getE(Tree.ITEM_FLAG + Tree.arr[sTreeId].oldNode);
			if (oOldNode) {
				if (null == getE(Tree.ULF + Tree.arr[sTreeId].oldNode))
					oOldNode.className = 'leef';
			}
		}

		// 将当前选中的节点保存
		Tree.arr[sTreeId].oldNode = sNodeId;

		// 如果选中的是叶子（根节点）则改变他的样式为选中状态样式。
		if (null == getE(uid)) {
			getE(imgId).className = 'leefhot';// getE(imgId).className + '
			// hot';
			return;
		}
	}
	// 如果选中的是普通节点（有子节点的节点），则展开或折叠该节点。
	if (!bHot)
		Tree._openClose(uid, imgId, iState);

};
Tree._openClose = function(sUid, sItemId, iState) {
	var oUid = getE(sUid);
	var oItem = getE(sItemId);
	if (null == oUid || null == oItem)
		return;
	switch (iState) {
	case 0: // 折叠
		oUid.style.display = 'none';
		oItem.className = 'clo';
		break;
	case 1: // 展开
		oUid.style.display = 'block';
		oItem.className = 'open';
		break;
	default: // 通过判断现有样式来决定展开和折叠
		if (oUid.style.display == 'block' || oUid.style.display == '') {
			Tree._openClose(sUid, sItemId, 0);
		} else {
			Tree._openClose(sUid, sItemId, 1);
		}
		break;
	}
};
/**
 * 展开一个节点
 * 
 * @param sNodeId
 *            节点ID
 * @param sTreeId
 *            树ID
 * @return
 */
Tree.openNode = function(sNodeId, sTreeId) {
	Tree.openClose(sNodeId, sTreeId, 1);
};
/**
 * 闭合一个节点
 * 
 * @param sNodeId
 * @param sTreeId
 * @return
 */
Tree.closeNode = function(sNodeId, sTreeId) {
	Tree.openClose(sNodeId, sTreeId, 0);
};
/**
 * 添加一个末级节点
 * 
 * @param sTreeId
 *            树ID
 * @param sContent
 *            节点的内容，可以是文本，也可以简单HTML代码
 * @return
 */
Tree.addLeef = function(sTreeId, sContent) {
	Tree.add(sTreeId, sContent, true);
};
/**
 * 添加一个非末级节点
 * 
 * @param sTreeId
 *            树ID
 * @param sContent
 *            节点的内容，可以是文本，也可以简单HTML代码
 * @return
 */
Tree.addNode = function(sTreeId, sContent) {
	Tree.add(sTreeId, sContent, false);
};
/**
 * 添加一个节点
 * 
 * @param sTreeId
 *            树ID
 * @param sContent
 *            节点的内容，可以是文本，也可以简单HTML代码
 * @param bLeef
 *            是否是叶子节点
 * @return
 */
Tree.add = function(sTreeId, sContent, bLeef) {
	var oTree = Tree.arr[sTreeId];
	if (null == oTree) {
		return;
	}
	var sCurrNode = oTree.currNode;
	var head = '', tail = '';
	var cObj = getE(Tree.ULF + sCurrNode);
	var oImg = getE(Tree.ITEM_FLAG + sCurrNode);
	var isUL = false;
	if (null == cObj) {
		isUL = true;
		cObj = getE(sCurrNode) || getE(sCurrNode = oTree.root);
		oImg.className = 'open';
	}

	Tree.openNode(sCurrNode, sTreeId);

	var cId = (cObj.childNodes.length + 1);

	// 修改添加id，将子节点中ID最大的数加1作为新节点的ID
	var lastNode = cObj.lastChild;
	var iNum;
	if (null != lastNode) {
		var lastId = lastNode.id;
		if (lastId) {
			var _index = lastId.lastIndexOf('_');
			if (_index < lastId.length) {
				iNum = lastId.substring(_index + 1);
				cId = Number(iNum) + 1;
			}
		}
	}

	var tmpCid = sCurrNode + '_';
	if (oTree.isRoot() && !isUL) {
		tmpCid = oTree.root + "_";
	} else {
		if (isUL) {
			var sUL = new StringBuffer('<ul id="');
			sUL.append(Tree.ULF).append(oTree.currNode).append('" ');
			head = sUL.append('>').toString();
			tail = '</ul>';
			cId = 1;
		}
	}
	tmpCid += cId;

	var sbf = new StringBuffer();
	sbf.append(cObj.innerHTML).append(head).append('<li ');
	sbf.append(' id="');
	sbf.append(tmpCid).append('"><span class="');
	if (bLeef)
		sbf.append('leef');
	else
		sbf.append('clo');
	sbf.append('" id="').append(Tree.ITEM_FLAG).append(tmpCid);
	sbf.append('" onclick="Tree.hotClick(\'').append(tmpCid);
	sbf.append('\',\'').append(sTreeId).append(
			'\')" /><span class="padding" onclick="Tree.click(\'');
	sbf.append(tmpCid).append('\',\'').append(sTreeId).append('\')" ></span>');
	sbf.append(sContent || tmpCid);
	sbf.append('</span></li>').append(tail);
	cObj.innerHTML = sbf.toString();
	sbf = null;
};
/**
 * 移除一个节点及其子节点
 * 
 * @param sTreeId
 *            树ID
 * @param sNodeId
 *            节点ID
 * @return
 */
Tree.removeNode = function(sTreeId, sNodeId) {
	var oT = Tree.arr[sTreeId];
	if (null == oT)
		return;

	var oC = getE(sNodeId || oT.currNode);
	if (null == oC)
		return;
	if (oC.id == oT.root)
		return;

	var oP = oC.parentNode;
	oP.removeChild(oC);
	var opp = oP.parentNode;
	if (null != opp)
		oT.currNode = opp.id;
	// getE("ul_ttt_0").removeChild(getE(oT.currNode));
};
/**
 * 移除节点下的所有子节点
 * 
 * @param sTreeId
 *            树ID
 * @param sNodeId
 *            节点ID
 * @return
 */
Tree.removeChild = function(sTreeId) {
	Tree.arr[sTreeId].removeSubNode();
};
Tree.prototype.removeSubNode = function() {
	var oT = this;
	if (null == oT)
		return;

	var sNodeId = oT.currNode;
	if (sNodeId)
		if (0 != sNodeId.indexOf(Tree.ULF))
			sNodeId = Tree.ULF + sNodeId;

	var oNode = getE(sNodeId) || getE(Tree.ULF + oT.currNode);
	if (null != oNode) {
		// oNode.innerHTML = '';
		var pNode = oNode.parentNode;
		pNode.removeChild(oNode);
	}
};
