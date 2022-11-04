
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
//$('.list-01').hover(function(){
//
//    let bgHight =  $('.menu-01').height();
//
//    $('.menu-01').slideDown();
//    $('.all-menu__bg').css('height',bgHight);
//    $('.all-menu__bg').slideDown();
//    console.log(bgHight);
//},function(){
//    $('.menu-01').css('display','none');
//    $('.all-menu__bg').css('display','none');
//})
//
//$('.menu-01').mouseenter(function(){
//    $('.menu-01').css('display','block');
//    $('.all-menu__bg').css('display','block');
//});
//
//$('.menu-01').mouseleave(function(){
//    $('.menu-01').css('display','none');
//    $('.all-menu__bg').css('display','none');
//});
//
//$('.list-02').hover(function(){
//
//    let bgHight =  $('.menu-02').height();
//
//    $('.menu-02').slideDown();
//    $('.all-menu__bg').css('height',bgHight);
//    $('.all-menu__bg').slideDown();
//},function(){
//    $('.menu-02').css('display','none');
//    $('.all-menu__bg').css('display','none');
//})
//
//$('.menu-02').mouseenter(function(){
//    $('.menu-02').css('display','block');
//    $('.all-menu__bg').css('display','block');
//});
//
//$('.menu-02').mouseleave(function(){
//    $('.menu-02').css('display','none');
//    $('.all-menu__bg').css('display','none');
//});

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

document.querySelector(".naver").addEventListener("click", function(e){
    e.preventDefault();
    window.open("/auth/naver.do","naverPopup", "width=500,height=600");
})
document.querySelector(".kakao").addEventListener("click", function(e){
    e.preventDefault();
    window.open("/auth/kakao.do","kakaoPopup", "width=500,height=600");
})
document.querySelector(".google").addEventListener("click", function(e){
    e.preventDefault();
    window.open("/auth/google.do","googlePopup", "width=500,height=600");
})
// $("form[name=frmPsnLogin]").submit(function(){
//     if ($('#psnUserId').val().trim() == '' || $('#psnUserPw').val().trim() == '') {
//         alert("ID 및 PW 를 입력하세요.");
//         return false;
//     }
// });
//
// $("form[name=frmComLogin]").submit(function(){
//     if ($('#comUserId').val().trim() == '' || $('#comUserPw').val().trim() == '') {
//         alert("ID 및 PW 를 입력하세요.");
//         return false;
//     }
// });
$("form[name=frmPsnLogin]").validate({
    // debug: true,
    rules: {
        userId: {
            required: true
        },
        userPw: {
            required: true
        }
    },
    messages: {
        userId: {
            required: "를 필수로 입력하세요"
        },
        userPw: {
            required: "를 필수로 입력하세요"
        }
    }
});

$("form[name=frmComLogin]").validate({
    // debug: true,
    rules: {
        userId: {
            required: true
        },
        userPw: {
            required: true
        }
    },
    messages: {
        userId: {
            required: "를 필수로 입력하세요"
        },
        userPw: {
            required: "를 필수로 입력하세요"
        }
    }
});
