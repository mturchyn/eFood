<@content for="title">User</@content>
<#--<a href="#" onclick="qqq()">qq</a> todo delete-->
<div id="myCarousel" class="carousel slide">
    <div class="carousel-inner">
        <div class="item active">
            <div class="day">
                <h3 class="day_of_week">Monday</h3>
                <div class="date"></div>
            </div>
            <div class="day">
                <h3 class="day_of_week">Tuesday</h3>
                <div class="date"></div>
            </div>
            <div class="day">
                <h3 class="day_of_week">Wednesday</h3>
                <div class="date"></div>
            </div>
            <div class="day">
                <h3 class="day_of_week">Thursday</h3>
                <div class="date"></div>
            </div>
            <div class="day">
                <h3 class="day_of_week">Friday</h3>
                <div class="date"></div>
            </div>
            <div class="day">
                <h3 class="day_of_week">Saturday</h3>
                <div class="date"></div>
            </div>
            <div class="day">
                <h3 class="day_of_week">Sunday</h3>
                <div class="date"></div>
            </div>
            <div style="float: left;">
                <br/>
                total sum: <span>0</span> BYR
                <br/>
                <button class="confirm">Confirm order</button>
            </div>
        </div>
        <div class="item">
            <img src="/efood/img/1.jpg" alt="">
            <div class="carousel-caption">
                <h4>Example headline.</h4>
                <p>fwfwe</p>
            </div>
        </div>
        <div class="item">
            <img src="/efood/img/2.jpg" alt="">
            <div class="carousel-caption">
                <h4>Example headline.</h4>
                <p>fwfwe</p>
            </div>
        </div>
        <div class="item">
            <img src="/efood/img/3.jpg" alt="">
            <div class="carousel-caption">
                <h4>Example headline.</h4>
                <p>fwfwe</p>
            </div>
        </div>
    </div>
    <a id="go_left" class="left carousel-control" href="#myCarousel" data-slide="prev" onclick="changeWeek(event,0)"></a>
    <a id="go_right" class="right carousel-control" href="#myCarousel" data-slide="next" onclick="changeWeek(event,0)"></a>
</div>
<script src="${context_path}/js/user_script.js" type="text/javascript"></script>