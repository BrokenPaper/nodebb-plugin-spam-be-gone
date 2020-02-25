<h1><i class="fa {faIcon}"></i> {name}</h1>
<style>
   .{nbbId}-settings .checkbox>label.section-title {
    font-size: 24px;
   }
   .{nbbId}-settings .checkbox>label>input[data-toggle-target] {
    margin-bottom: 0;
   }
</style>
<form role="form" class="{nbbId}-settings">
   <fieldset>
      <div class="row">
         <div class="col-sm-12">
            <div class="checkbox">
               <label class="section-title">
               <input data-toggle-target="#akismetApiKey,#akismetMinReputationHam,#akismetFlagReporting" type="checkbox" id="akismetEnabled" name="akismetEnabled"/>
               启用 Akismet
               </label>
            </div>
            <p class="help-block">要检查每个用户的发帖. 从
               <a target="_blank" href="http://akismet.com/">akismet.com</a> 获得你的API
            </p>
            <div class="form-group">
               <label for="akismetApiKey">Akismet API Key</label>
               <input placeholder="输入 Akismet API Key" type="text" class="form-control" id="akismetApiKey" name="akismetApiKey"/>
            </div>
            <div class="form-group">
               <label for="akismetMinReputationHam">HAM 最小所需声望</label>
               <input placeholder="10" type="number" class="form-control" id="akismetMinReputationHam" name="akismetMinReputationHam"/>
            </div>
            <p class="help-block">最小的声望等级去界定被标记的帖子是误报的 (HAM). 声望不少于这个等级的用户发布的帖子永远不会被标记为垃圾信息.</p>
            <div class="form-group">
               <label for="akismetFlagReporting">标记最小所需声望</label>
               <input placeholder="5" type="text" class="form-control" id="akismetFlagReporting" name="akismetFlagReporting"/>
            </div>
            <p class="help-block">允许用户通过标记向Akismet报告垃圾帖子所需要的最小声望值 (留空关闭)</p>
            <hr />
            <div class="checkbox">
               <label class="section-title">
               <input data-toggle-target="#honeypotApiKey" type="checkbox" id="honeypotEnabled" name="honeypotEnabled"/>启用 Honeypot
               </label>
            </div>
            <p class="help-block">要检查用户的每一次注册. 从
               <a target="_blank" href="http://www.projecthoneypot.org/">projecthoneypot.org</a> 获得
            </p>
            <div class="form-group">
               <label for="honeypotApiKey">Honeypot API Key</label>
               <input placeholder="输入 Honeypot API Key" type="text" class="form-control" id="honeypotApiKey" name="honeypotApiKey"/>
            </div>
            <hr />
            <div class="checkbox">
               <label class="section-title">
               <input data-toggle-target="#recaptchaPublicKey,#recaptchaPrivateKey,#loginRecaptchaEnabled" type="checkbox" id="recaptchaEnabled" name="recaptchaEnabled"/> 启用 Re-Captcha
               </label>
            </div>
            <p class="help-block">要检查用户的每一次注册. 你需要有个公钥和私钥, 从
               <a target="_blank" href="http://www.google.com/recaptcha">google.com/recaptcha</a> 获得
            </p>
            <div class="form-inline">
               <div class="form-group" style="width:45%;">
                  <label for="recaptchaPublicKey">Re-Captcha 公钥</label>
                  <input placeholder="这里输入公钥" type="text" class="recaptchaKey form-control" id="recaptchaPublicKey" name="recaptchaPublicKey"/>
               </div>
               <div class="form-group" style="width:45%;">
                  <label for="recaptchaPrivateKey">Re-Captcha 私钥</label>
                  <input placeholder="这里输入私钥" type="text" class="recaptchaKey form-control" id="recaptchaPrivateKey" name="recaptchaPrivateKey"/>
               </div>
            </div>
            <p class="help-block">
               不要泄露你的私钥
            </p>
            <div class="checkbox">
               <label>
               <input type="checkbox" id="loginRecaptchaEnabled" name="loginRecaptchaEnabled"/>
                <small>在登录页面也启用 Re-Captcha</small>
               </label>
            </div>
            <hr />
            <div class="checkbox">
               <label class="section-title">
               <input data-toggle-target="#stopforumspamApiKey" type="checkbox" id="stopforumspamEnabled" name="stopforumspamEnabled"/> Enable StopForumSpam
               </label>
            </div>
            <p class="help-block">
               要举报用户你需要 API key, 从 <a target="_blank" href="https://www.stopforumspam.com/keys">stopforumspam.com/keys</a> 获得
            </p>
            <div class="form-group" style="width:45%;">
               <label for="stopforumspamApiKey">输入 StopForumSpam API Key</label>
               <input placeholder="输入API key" type="text" class="stopforumspamApiKey form-control" id="stopforumspamApiKey" name="stopforumspamApiKey"/>
            </div>
         </div>
      </div>
      <hr/>
      <button class="btn btn-lg btn-primary" id="save" type="button">保存</button>
      <p class="help-block">
         这个插件使用
         <a target="_blank" href="https://github.com/julianlam/project-honeypot">project-honeypot</a>,
         <a target="_blank" href="https://github.com/deltreey/stopforumspam">stopforumspam</a>,
         <a target="_blank" href="https://github.com/oozcitak/akismet-js">akismet-js</a>,
         and <a target="_blank" href="https://github.com/zeMirco/simple-recaptcha">simple-recaptcha</a>
         <br/>
         File issues, pull requests or ideas at the
         <a target="_blank" href="https://github.com/akhoury/nodebb-plugin-spam-be-gone">github repo</a>
      </p>
   </fieldset>
</form>
<script type="text/javascript">
   require(['settings'], function(Settings) {
     var nbbId = '{nbbId}',
     klass = nbbId + '-settings',
     wrapper = $( '.' + klass );

     function onChange (e) {
       var target = $(e.target);
       var input = wrapper.find(target.attr('data-toggle-target'));
       if (target.is(':checked')) {
         input.prop('disabled', false);
       } else {
         input.prop('disabled', true);
       }
     }

     wrapper.find('input[type="checkbox"].section-title').on('change', onChange);

     Settings.load(nbbId, wrapper, function() {
       wrapper.find('input[type="checkbox"].section-title').each(function() {
         onChange({target: this});
       });
     });

     wrapper.find('#save').on('click', function(e) {
       e.preventDefault();
       wrapper.find('.form-group').removeClass('has-error');

       var invalidSelector = '';
       var invalidCount = 0;
       wrapper.find('input[type="checkbox"].section-title').each(function(i, checkbox) {
         checkbox = $(checkbox);
         if (checkbox.is(':checked') && !wrapper.find(checkbox.attr('data-toggle-target')).val()) {
           invalidSelector += (!invalidCount++ ? '' : ', ') + checkbox.attr('data-toggle-target');
         }
       });

       if (invalidSelector) {
         wrapper.find(invalidSelector).each(function(i, el) {
           el = $(el);
           el.parents('.form-group').addClass('has-error');
         });
       } else {
         Settings.save(nbbId, wrapper, function() {
           app.alert({
             type: 'success',
             alert_id: nbbId,
             title: '需要重载',
             message: '请重载你的NodeBB让更改生效',
             clickfn: function() {
               socket.emit('admin.reload');
             }
           });
         });
       }
     });
   });
</script>
