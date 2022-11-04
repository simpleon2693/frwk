$(document).ready(function(){

    /* 모바일 메뉴 */
    $('.m-nav__item-01').on('click',function(){
        $(this).find('.m-nav__depth-02').slideDown();
        $('.m-nav__item-01').not($(this)).find('.m-nav__depth-02').css('display','none');
    });

    $('.head-wrap__m-btn').on('click',function(){
        $('.m-nav').css('display','block');
    })
    $('.m-nav__close').on('click',function(){
        $('.m-nav').css('display','none');
    });

    /* 데스크탑 메뉴 */
    $('.head-nav__depth-01').hover(function(){
        $('.mega-menu').slideDown();
        $('.mega-menu__bg').slideDown();
    },function(){
        $('.mega-menu').css('display','none'); 
        $('.mega-menu__bg').css('display','none');
    });

    $('.mega-menu').mouseenter(function(){
        $('.mega-menu').css('display','block'); 
        $('.mega-menu__bg').css('display','block');
    });

    $('.mega-menu').mouseleave(function(){
        $('.mega-menu').css('display','none'); 
        $('.mega-menu__bg').css('display','none');
    });

})