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
 *            ����Ψһ��ʶ
 * @param className
 *            ��ʽ����
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
 *            ����Ψһ��ʶ
 * @param className
 *            ��ʽ����
 * @param bReplace
 *            �������ͬ��ʶ�����ڣ��Ƿ��滻������
 * @return һ��treeʵ��
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
 *            ����Ψһ��ʶ
 * @param plus
 *            չ��ͼ��·��
 * @param minus
 *            �۵�ͼ��·��
 * @param className
 *            ��ʽ����
 * @param bReplace
 *            �Ƿ��滻������
 * @return
 * @deprecated �ѹ�ʱ,�ο�Tree.createTree
 */
Tree.create = function(id, plus, minus, className, bReplace) {
	Tree.createTree(id, className, bReplace);
};
Tree.prototype._init = function() {
	var oT = getE(this.id);
	// �������ݹ�������ֹ��ѭ����
	this.maxLoop = 1000;
	if (null != oT) {
		oT.className = this.className;
		this._setTree(oT);
	}
};
/**
 * ��ҳ������ʼ��Ϊһ����,�÷������еݹ���ñ������еĽڵ㡣
 * 
 * @param o
 *            �ڵ�
 * @param pId
 *            ���ڵ�
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
 * �жϵ�ǰ�ڵ��Ƿ��Ǹ��ڵ㡣
 * 
 * @return true���ǵ�ǰ�ڵ��Ǹ��ڵ㡣
 */
Tree.prototype.isRoot = function() {
	return this.root == this.currNode;
};
/**
 * �����������
 * 
 * @param d
 * @return
 */
Tree.setDepth = function(d) {
	Tree.depth = d || 3;
};
/**
 * �ڵ㵥���¼�
 * 
 * @param id
 *            �ڵ�ID
 * @param treeId
 *            ��ID
 * @return
 */
Tree.click = function(id, treeId) {
	Tree.openClose(id, treeId, 2);
};
Tree.hotClick = function(id, treeId) {
	Tree.openClose(id, treeId, 2, true);
};
/**
 * չ����պϽڵ�
 * 
 * @param sNodeId
 *            �ڵ�ID
 * @param sTreeId
 *            ��ID
 * @param iState
 *            ״̬��0���պϣ�1���رգ�2�����ݽڵ㵱ǰ״̬��չ����պϽڵ�
 * @param bHot
 *            ���Ϊtrue,��ֻ�ı�ڵ���ʽ�������۵��ڵ�
 * @return
 */
Tree.openClose = function(sNodeId, sTreeId, iState, bHot) {
	var uid = Tree.ULF + sNodeId;
	var imgId = Tree.ITEM_FLAG + sNodeId;
	Tree.arr[sTreeId].currNode = sNodeId;

	// ���ǰ��ѡ�е���Ҷ�ӣ����ڵ㣩�����޸�ǰ��ѡ�нڵ���ʽ��
	if (2 == iState) {
		if ('' != Tree.arr[sTreeId].oldNode) {
			var oOldNode = getE(Tree.ITEM_FLAG + Tree.arr[sTreeId].oldNode);
			if (oOldNode) {
				if (null == getE(Tree.ULF + Tree.arr[sTreeId].oldNode))
					oOldNode.className = 'leef';
			}
		}

		// ����ǰѡ�еĽڵ㱣��
		Tree.arr[sTreeId].oldNode = sNodeId;

		// ���ѡ�е���Ҷ�ӣ����ڵ㣩��ı�������ʽΪѡ��״̬��ʽ��
		if (null == getE(uid)) {
			getE(imgId).className = 'leefhot';// getE(imgId).className + '
			// hot';
			return;
		}
	}
	// ���ѡ�е�����ͨ�ڵ㣨���ӽڵ�Ľڵ㣩����չ�����۵��ýڵ㡣
	if (!bHot)
		Tree._openClose(uid, imgId, iState);

};
Tree._openClose = function(sUid, sItemId, iState) {
	var oUid = getE(sUid);
	var oItem = getE(sItemId);
	if (null == oUid || null == oItem)
		return;
	switch (iState) {
	case 0: // �۵�
		oUid.style.display = 'none';
		oItem.className = 'clo';
		break;
	case 1: // չ��
		oUid.style.display = 'block';
		oItem.className = 'open';
		break;
	default: // ͨ���ж�������ʽ������չ�����۵�
		if (oUid.style.display == 'block' || oUid.style.display == '') {
			Tree._openClose(sUid, sItemId, 0);
		} else {
			Tree._openClose(sUid, sItemId, 1);
		}
		break;
	}
};
/**
 * չ��һ���ڵ�
 * 
 * @param sNodeId
 *            �ڵ�ID
 * @param sTreeId
 *            ��ID
 * @return
 */
Tree.openNode = function(sNodeId, sTreeId) {
	Tree.openClose(sNodeId, sTreeId, 1);
};
/**
 * �պ�һ���ڵ�
 * 
 * @param sNodeId
 * @param sTreeId
 * @return
 */
Tree.closeNode = function(sNodeId, sTreeId) {
	Tree.openClose(sNodeId, sTreeId, 0);
};
/**
 * ���һ��ĩ���ڵ�
 * 
 * @param sTreeId
 *            ��ID
 * @param sContent
 *            �ڵ�����ݣ��������ı���Ҳ���Լ�HTML����
 * @return
 */
Tree.addLeef = function(sTreeId, sContent) {
	Tree.add(sTreeId, sContent, true);
};
/**
 * ���һ����ĩ���ڵ�
 * 
 * @param sTreeId
 *            ��ID
 * @param sContent
 *            �ڵ�����ݣ��������ı���Ҳ���Լ�HTML����
 * @return
 */
Tree.addNode = function(sTreeId, sContent) {
	Tree.add(sTreeId, sContent, false);
};
/**
 * ���һ���ڵ�
 * 
 * @param sTreeId
 *            ��ID
 * @param sContent
 *            �ڵ�����ݣ��������ı���Ҳ���Լ�HTML����
 * @param bLeef
 *            �Ƿ���Ҷ�ӽڵ�
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

	// �޸����id�����ӽڵ���ID��������1��Ϊ�½ڵ��ID
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
 * �Ƴ�һ���ڵ㼰���ӽڵ�
 * 
 * @param sTreeId
 *            ��ID
 * @param sNodeId
 *            �ڵ�ID
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
 * �Ƴ��ڵ��µ������ӽڵ�
 * 
 * @param sTreeId
 *            ��ID
 * @param sNodeId
 *            �ڵ�ID
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
