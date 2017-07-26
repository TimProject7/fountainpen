
$( function () {
    //첫번째 배너
    $( "#image_list_1" ).jQBanner( {//롤링을 할 영역의 ID 값
        nWidth: 1080,				//영역의 width
        nHeight: 485,				//영역의 height
        nCount: 5,					//돌아갈 이미지 개수
        isActType: "left",			//움직일 방향 (left, right, up, down)
        nOrderNo: 1,				//초기 이미지
        nDelay: 2500				//롤링 시간 타임 (1000 = 1초)
    } );

} );