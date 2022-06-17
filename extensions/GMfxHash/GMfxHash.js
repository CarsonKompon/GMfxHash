function GMfxHash_fxhash(){
	return fxhash;
}

function GMfxHash_fxrand(){
	return fxrand();
}

function GMfxHash_fxpreview() {
	fxpreview();
	return 1;
}

function GMfxHash_isFxpreview(){
	return isFxpreview;
}

function GMfxHash_features(){
	return JSON.stringify(window.$fxhashFeatures);
}