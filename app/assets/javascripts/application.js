// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .


function main() {

(function () {
   'use strict';
   
    $('a.page-scroll').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html,body').animate({
              scrollTop: target.offset().top - 40
            }, 900);
            return false;
          }
        }
      });

    // affix the navbar after scroll below header
$('#nav').affix({
      offset: {
        top: $('header').height()
      }
}); 

    // skills chart
    $(document).ready(function(e) {
    //var windowBottom = $(window).height();
    var index=0;
    $(document).scroll(function(){
        var top = $('#skills').height()-$(window).scrollTop();
        console.log(top)
        if(top<-300){
            if(index==0){   
            
                $('.chart').easyPieChart({
                    easing: 'easeOutBounce',
                    onStep: function(from, to, percent) {
                        $(this.el).find('.percent').text(Math.round(percent));
                    }
                });
            
                }
            index++;
        }
    })
    //console.log(nagativeValue)
    });


    // Portfolio isotope filter
    $(window).load(function() {
        var $container = $('.portfolio-items');
        $container.isotope({
            filter: '*',
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
        });
        $('.cat a').click(function() {
            $('.cat .active').removeClass('active');
            $(this).addClass('active');
            var selector = $(this).attr('data-filter');
            $container.isotope({
                filter: selector,
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                }
            });
            return false;
        });

    });
    
        
    // CounterUp
    $(document).ready(function( $ ) {
        if($("span.count").length > 0){ 
            $('span.count').counterUp({
                    delay: 10, // the delay time in ms
            time: 1500 // the speed time in ms
            });
        }
    });
    
    // Pretty Photo
    $("a[rel^='prettyPhoto']").prettyPhoto({
        social_tools: false
    }); 

}());


}
main();
