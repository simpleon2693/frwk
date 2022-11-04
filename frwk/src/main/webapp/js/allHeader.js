$(document).ready(function(){
    /* 비로그인 헤더 */
    $('.sitemap').on({

        mouseenter: function(){
            let bgHight =  $('.sitemenu').height();

            $('.all-menu__bg').css('height',bgHight);
            $('.sitemenu').css('display','block');
            $('.all-menu__bg').css('display','block');
            console.log(123);
        },
        mouseleave: function(){
            $('.sitemenu').css('display','none');
            $('.all-menu__bg').css('display','none');
        }
    })

    $('.list-01').on({

        mouseenter: function(){
            let bgHight =  $('.menu-01').height();

            $('.all-menu__bg').css('height',bgHight);
            $('.menu-01').css('display','block');
            $('.all-menu__bg').css('display','block');
            console.log(123);
        },
        mouseleave: function(){
            $('.menu-01').css('display','none');
            $('.all-menu__bg').css('display','none');

        }
    })

    $('.list-02').on({

        mouseenter: function(){
            let bgHight =  $('.menu-02').height();

            $('.all-menu__bg').css('height',bgHight);
            $('.menu-02').css('display','block');
            $('.all-menu__bg').css('display','block');
        },
        mouseleave: function(){
            $('.menu-02').css('display','none');
            $('.all-menu__bg').css('display','none');

        }
    })
    
     $('.mega-menu').on({
        mouseenter: function(){
            $(this).css('display','block'); 
            $('.all-menu__bg').css('display','block');
        },
        mouseleave: function(){
            $(this).css('display','none'); 
            $('.all-menu__bg').css('display','none');
            
        }
    })


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

}) 
