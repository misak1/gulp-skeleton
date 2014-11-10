(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
(function(window, document, $) {
  var mAcordion, mRedirect;
  mAcordion = (function() {
    function mAcordion(context) {
      this.acdon = context;
      if (this.acdon.length !== 0) {
        this.init();
      }
    }

    mAcordion.prototype.init = function() {
      var swtBtn;
      swtBtn = this.acdon.find('.switcher_btn');
      return swtBtn.on('click', function() {
        $(this).toggleClass('active').next().slideToggle();
        return false;
      });
    };

    return mAcordion;

  })();
  mRedirect = (function() {
    function mRedirect() {}

    mRedirect.prototype.publicFunc = function() {
      var Android, iPhone, mobile, myurl, reurl, spurl, useragent;
      useragent = navigator.userAgent;
      iPhone = useragent.match(/iPhone/);
      Android = useragent.match(/Android/);
      mobile = useragent.match(/Mobile/);
      myurl = location.href;
      spurl = myurl.match(/\/sp\//);
      if (iPhone) {
        if (!spurl) {
          reurl = myurl.replace("/", "/sp/");
          location.href = reurl;
        }
      }
      if (Android && mobile) {
        if (!spurl) {
          reurl = myurl.replace("/", "/sp/");
          return location.href = reurl;
        }
      }
    };

    return mRedirect;

  })();
  new mAcordion($('.switcher'));
})(window, document, jQuery || {});



},{}]},{},[1])