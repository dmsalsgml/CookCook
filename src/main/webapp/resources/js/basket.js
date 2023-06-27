$( document ).ready(function() {
    
    "use strict";
    
    $(".checkOne").each((i,e)=>{
        if(e.getAttribute("status")=="4002"){
            e.parentElement.parentElement.parentElement.classList.toggle('complete');
            e.checked = true;
        }
    });

    var todo = function() { 
        $(".card-body").on("click",'.todo-list .todo-item input', function() {
            let target = $(this);
            if(target.is(':checked')) {
            //DB에 update
            $.ajax({
                url:"/basket/updateChecked",
                type:"post",
                data:{
					code:target.prop("id"),
                },
            }).done(function(){
                target.attr("status","4002");
                target.parent().parent().parent().toggleClass('complete');
            });
        } else {
            $.ajax({
                url:"/basket/updateUnchecked",
                type:"post",
                data:{
					code:target.prop("id"),
                },
            }).done(function(){
                target.attr("status","4001");
                target.parent().parent().parent().toggleClass('complete');
            });
        }
       });
    
    $(".card-body").on("click",'.todo-nav .all-task', function() {
        console.log(222222);
        console.log(this);
        $('.todo-list').removeClass('only-active');
        $('.todo-list').removeClass('only-complete');
        $('.todo-nav li.active').removeClass('active');
        $(this).addClass('active');
    });
    
    $(".card-body").on("click",'.todo-nav .active-task', function() {
        console.log(333333);
        console.log(this);
        $('.todo-list').removeClass('only-complete');
        $('.todo-list').addClass('only-active');
        $('.todo-nav li.active').removeClass('active');
        $(this).addClass('active');
    });
    
    $(".card-body").on("click",'.todo-nav .completed-task', function() {
        console.log(444444);
        console.log(this);
        $('.todo-list').removeClass('only-active');
        $('.todo-list').addClass('only-complete');
        $('.todo-nav li.active').removeClass('active');
        $(this).addClass('active');
    });
    
    $(".card-body").on("click",'#uniform-all-complete input', function() {
        console.log(555555);
        console.log(this);
        if($(this).is(':checked')) {
            $('.todo-item .checker span:not(.checked) input').click();
        } else {
            $('.todo-item .checker span.checked input').click();
        }
    });
    
    $(".card-body").on("click",'.remove-todo-item', function() {
        console.log(666666);
        console.log(this);
        $(this).parent().remove();
    });
    };
    
    todo();
    
    $(".add-task").keypress(function (e) {
        if ((e.which == 13)&&(!$(this).val().length == 0)) {
            // DB에 입력하기
            $.ajax({
                url:"/basket/insertOne",
                type:"post",
                data:{
                    name:$(this).val(),
                },
            }).done(function(code){
                $(`<div class="todo-item position-relative"><div class="checker"><span class=""><input type="checkbox" class="checkOne" id=${code} status="4001"></span></div> <span>' + $(this).val() + '</span> <a href="javascript:void(0);" class="float-right remove-todo-item"><i class="icon-close"></i></a><button type="button" class="btn btn-success position-absolute btnDeleteOne">X</button></div>`).insertAfter('.todo-list .todo-item:last-child');
                $(this).val('');
            });

        } else if(e.which == 13) {
            alert('재료의 이름을 입력해주세요.');
        }
        $(document).on('.todo-list .todo-item.added input').click(function() {
            if($(this).is(':checked')) {
                $(this).parent().parent().parent().toggleClass('complete');
            } else {
                $(this).parent().parent().parent().toggleClass('complete');
            }
        });
        $('.todo-list .todo-item.added .remove-todo-item').click(function() {
            $(this).parent().remove();
        });
    });
}); 