<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<h2>Sliders with min and max Range and Events</h2>

<p class="text">
	Slider with min and max Range in a form with AJAX submit.<br/>
	The slider raise an event when slide is stoping.
</p>
<strong>Result Div :</strong>

<div id="result" class="result ui-widget-content ui-corner-all">Submit form bellow.</div>

<s:form id="form1" action="echo" theme="xhtml" cssStyle="width: 400px; margin: 10px;">
	<sj:slider id="echo1" name="echo" label="Echo" value="70" onCompleteTopics="sliderStop" range="min" min="20"
	           max="200" step="5" cssStyle="width: 300px; margin: 10px;"/>
	<sj:submit id="slidersubmit1" targets="result" value="AJAX Submit" button="true"
	           indicator="indicator_slider_range1"/> <img id="indicator_slider_range1" src="images/indicator.gif"
	                                                      alt="Loading..." style="display:none"/>
</s:form>
<s:form id="form2" action="echo" theme="xhtml" cssStyle="width: 400px; margin: 10px;">
	<sj:slider id="echo2" name="echo" label="Echo" value="120" orientation="vertical" onCompleteTopics="sliderStop"
	           range="max" min="20" max="200" step="5" cssStyle="height: 200px; margin: 10px;"/>
	<sj:submit id="slidersubmit2" targets="result" value="AJAX Submit" button="true"
	           indicator="indicator_slider_range2"/> <img id="indicator_slider_range2" src="images/indicator.gif"
	                                                      alt="Loading..." style="display:none"/>
</s:form>
<s:form id="form3" action="echo" theme="xhtml" cssStyle="width: 400px; margin: 10px;">
	<sj:slider id="echo3" name="echo" label="Echo" value="[15,55]" onCompleteTopics="sliderRangeStop" step="5"
	           cssStyle="margin: 10px;"/>
	<sj:submit id="slidersubmit3" targets="result" value="AJAX Submit" button="true"
	           indicator="indicator_slider_range3"/> <img id="indicator_slider_range3" src="images/indicator.gif"
	                                                      alt="Loading..." style="display:none"/>
</s:form>
<s:form id="form4" action="echo" theme="xhtml" cssStyle="width: 400px; margin: 10px;">
	<sj:slider id="echo4" name="echo" label="Echo" value="{3, 7}" min="1" max="10" onCompleteTopics="sliderRangeStop"
	           cssStyle="margin: 10px;"/>
	<sj:submit id="slidersubmit4" targets="result" value="AJAX Submit" button="true"
	           indicator="indicator_slider_range4"/> <img id="indicator_slider_range4" src="images/indicator.gif"
	                                                      alt="Loading..." style="display:none"/>
</s:form>

<div class="code ui-widget-content ui-corner-all">
	<strong>Code:</strong>
	  <pre>
	&lt;script type="text/javascript"&gt;
	$.subscribe('sliderStop', function(event, data) {
		alert('Slider stoped with value : ' + event.originalEvent.ui.value);
	});
	$.subscribe('sliderRangeStop', function(event, data) {
		alert('Slider stoped with values : ' + event.originalEvent.ui.values[0] + ' - ' + event.originalEvent.ui.values[1]);
	});
	&lt;/script&gt;        
	
	&lt;div id=&quot;result&quot; class=&quot;result ui-widget-content ui-corner-all&quot;&gt;Submit form bellow.&lt;/div&gt;

    &lt;s:form id=&quot;form1&quot; action=&quot;echo&quot; theme=&quot;xhtml&quot; cssStyle=&quot;width: 400px; margin: 10px;&quot;&gt;
         &lt;sj:slider id=&quot;echo1&quot; name=&quot;echo&quot; label=&quot;Echo&quot; value=&quot;70&quot; onCompleteTopics=&quot;sliderStop&quot; range=&quot;min&quot; min=&quot;20&quot; max=&quot;200&quot; step=&quot;5&quot; cssStyle=&quot;width: 300px; margin: 10px;&quot;/&gt;
         &lt;sj:submit id=&quot;slidersubmit1&quot; targets=&quot;result&quot; value=&quot;AJAX Submit&quot; button=&quot;true&quot; indicator=&quot;indicator_slider_range1&quot;/&gt; &lt;img id=&quot;indicator_slider_range1&quot; src=&quot;images/indicator.gif&quot; alt=&quot;Loading...&quot; style=&quot;display:none&quot;/&gt; 
    &lt;/s:form&gt;
    &lt;s:form id=&quot;form2&quot; action=&quot;echo&quot; theme=&quot;xhtml&quot; cssStyle=&quot;width: 400px; margin: 10px;&quot;&gt;
         &lt;sj:slider id=&quot;echo2&quot; name=&quot;echo&quot; label=&quot;Echo&quot; value=&quot;120&quot; orientation=&quot;vertical&quot; onCompleteTopics=&quot;sliderStop&quot; range=&quot;max&quot; min=&quot;20&quot; max=&quot;200&quot; step=&quot;5&quot; cssStyle=&quot;height: 200px; margin: 10px;&quot;/&gt;
         &lt;sj:submit id=&quot;slidersubmit2&quot; targets=&quot;result&quot; value=&quot;AJAX Submit&quot; button=&quot;true&quot; indicator=&quot;indicator_slider_range2&quot;/&gt; &lt;img id=&quot;indicator_slider_range2&quot; src=&quot;images/indicator.gif&quot; alt=&quot;Loading...&quot; style=&quot;display:none&quot;/&gt; 
    &lt;/s:form&gt;
    &lt;s:form id=&quot;form3&quot; action=&quot;echo&quot; theme=&quot;xhtml&quot; cssStyle=&quot;width: 400px; margin: 10px;&quot;&gt;
         &lt;sj:slider id=&quot;echo3&quot; name=&quot;echo&quot; label=&quot;Echo&quot; value=&quot;[15,55]&quot; onCompleteTopics=&quot;sliderRangeStop&quot; step=&quot;5&quot; cssStyle=&quot;margin: 10px;&quot;/&gt;
         &lt;sj:submit id=&quot;slidersubmit3&quot; targets=&quot;result&quot; value=&quot;AJAX Submit&quot; button=&quot;true&quot; indicator=&quot;indicator_slider_range3&quot;/&gt; &lt;img id=&quot;indicator_slider_range3&quot; src=&quot;images/indicator.gif&quot; alt=&quot;Loading...&quot; style=&quot;display:none&quot;/&gt; 
    &lt;/s:form&gt;
    &lt;s:form id=&quot;form4&quot; action=&quot;echo&quot; theme=&quot;xhtml&quot; cssStyle=&quot;width: 400px; margin: 10px;&quot;&gt;
         &lt;sj:slider id=&quot;echo4&quot; name=&quot;echo&quot; label=&quot;Echo&quot; value=&quot;{3, 7}&quot; min=&quot;1&quot; max=&quot;10&quot; onCompleteTopics=&quot;sliderRangeStop&quot; cssStyle=&quot;margin: 10px;&quot;/&gt;
         &lt;sj:submit id=&quot;slidersubmit4&quot; targets=&quot;result&quot; value=&quot;AJAX Submit&quot; button=&quot;true&quot; indicator=&quot;indicator_slider_range4&quot;/&gt; &lt;img id=&quot;indicator_slider_range4&quot; src=&quot;images/indicator.gif&quot; alt=&quot;Loading...&quot; style=&quot;display:none&quot;/&gt; 
    &lt;/s:form&gt;
	  </pre>
</div>
