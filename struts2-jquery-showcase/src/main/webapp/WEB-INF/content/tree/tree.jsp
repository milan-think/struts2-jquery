<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sjt" uri="/struts-jquery-tree-tags" %>
<h2>Static Tree</h2>

<p class="text">
	A simple static Tree Component.
</p>
<sjt:tree id="treeStatic" jstreetheme="default" openAllOnLoad="true">
	<sjt:treeItem title="Struts2">
		<sjt:treeItem title="General">
			<sjt:treeItem title="Struts2" href="http://struts.apache.org/2.x/index.html"/>
			<sjt:treeItem title="Struts2 @ Facebook"
			              href="http://www.facebook.com/pages/Struts2-Users/103890046351798"/>
		</sjt:treeItem>
		<sjt:treeItem title="Plugins">
			<sjt:treeItem title="Struts2 Plugins" href="https://cwiki.apache.org/S2PLUGINS/home.html"/>
			<sjt:treeItem title="Struts2 jQuery Plugin" href="https://github.com/struts-community-plugins/struts2-jquery/"/>
			<sjt:treeItem title="Struts2 Full Hibernate Plugin"
			              href="http://code.google.com/p/full-hibernate-plugin-for-struts2/"/>
		</sjt:treeItem>
		<sjt:treeItem title="Blogs">
			<sjt:treeItem title="Struts2 jQuery News" href="http://www.jgeppert.com/category/java/struts2-jquery/"/>
		</sjt:treeItem>
		<sjt:treeItem title="AJAX Links">
			<s:url var="ajax1" value="/ajax1.action"/>
			<sjt:treeItem title="Ajax 1" href="%{ajax1}" targets="result"/>
			<s:url var="ajax2" value="/ajax2.action"/>
			<sjt:treeItem title="Ajax 2" href="%{ajax2}" targets="result" effect="highlight" effectDuration="2500"/>
			<s:url var="ajax3" value="/ajax3.action"/>
			<sjt:treeItem title="Ajax 3" href="%{ajax3}" targets="result" onBeforeTopics="beforeLink"
			              onCompleteTopics="completeLink"/>
			<s:url var="ajax4" value="/ajax4.action"/>
			<sjt:treeItem title="Ajax 4" href="%{ajax4}" targets="result" effect="bounce" effectDuration="1000"/>
		</sjt:treeItem>
	</sjt:treeItem>
</sjt:tree>

<strong>Result Div :</strong>

<div id="result" class="result ui-widget-content ui-corner-all">Click on the AJAX Links above.</div>


<h2>Dynamic Tree with AJAX Links and Contextmenu</h2>

<p class="text">
	A Tree Component rendered on the server with AJAX Links and Contextmenu.
</p>
<s:url var="echo" value="/echo.action"/>
<sjt:tree
		id="treeDynamicAjax"
		rootNode="nodes"
		childCollectionProperty="children"
		nodeTitleProperty="text"
		nodeIdProperty="id"
		nodeHref="%{echo}"
		nodeHrefParamName="echo"
		nodeTargets="result2"
		contextmenu="{
    			items: { 
    				'create' : false,
    				'rename' : false,
    				'ccp' : false,
    				'remove' : { 
    					'label': 'Delete this Node', 
    					'action':  function (obj) {
    					    var ref = $('#treeDynamicAjax').jstree(true),
							    sel = ref.get_selected();
							if(!sel.length) { return false; }
							deleteTreeNode('%{echo}', sel);
							ref.delete_node(sel);
						}
    				} 
    			} 
    		}"
		/>

<strong>Result Div :</strong>

<div id="result2" class="result ui-widget-content ui-corner-all">Click on the AJAX Links above.</div>

<h2>Dynamic Tree in form with Checkboxes</h2>

<p class="text">
	A Tree Component in a form with Checkboxes.
</p>
<s:form id="treeForm" action="echo" theme="simple">
	<sjt:tree
			name="echo"
			id="treeDynamicCheckboxes"
			rootNode="nodes"
			childCollectionProperty="children"
			nodeTitleProperty="text"
			nodeIdProperty="id"
			openAllOnLoad="true"
			checkbox="true"
			checkboxToogleAllTopics="toogleAllNodesTopic"
			checkboxShowTopics="showCheckboxesTopic"
			checkboxHideTopics="hideCheckboxesTopic"
			onClickTopics="treeClicked"
            showThemeDots="false"
            showThemeIcons="false"
			/>
	<sj:submit formIds="treeForm" targets="result3" button="true"/>
	<sj:submit onClickTopics="toogleAllNodesTopic" value="Toogle all Nodes" button="true"/>
	<sj:submit onClickTopics="showCheckboxesTopic" value="Show Checkboxes" button="true"/>
	<sj:submit onClickTopics="hideCheckboxesTopic" value="Hide Checkboxes" button="true"/>
</s:form>
<strong>Result Div :</strong>

<div id="result3" class="result ui-widget-content ui-corner-all">Click on the AJAX Submit above.</div>


<h2>Tree with Types</h2>

<p class="text">
	A Tree with different node types.
</p>
<s:set id="contextPath" value="#request.get('javax.servlet.forward.context_path')"/>
<sjt:tree
		id="treeTypes"
		jstreetheme="default"
		openAllOnLoad="true"
		types="{
            'root' : {
                'max_children' : 1,
                'max_depth' : 4,
                'icon' : '%{contextPath}/images/root.png',
                'valid_children' : [ 'folder', 'file' ]
            },
            'folder' : {
                'icon' : '%{contextPath}/images/folder.png',
                'valid_children' : [ 'folder', 'file' ]
            },
            'file' : {
                'icon' : '%{contextPath}/images/file.png',
                'valid_children' : [ ]
            }
		}">
	<sjt:treeItem title="Root" type="root">
		<sjt:treeItem title="Folder One" type="folder">
			<sjt:treeItem title="File One" type="file"/>
			<sjt:treeItem title="File Two" type="file"/>
		</sjt:treeItem>
		<sjt:treeItem title="Folder Two" type="folder">
			<sjt:treeItem title="Folder Three" type="folder">
				<sjt:treeItem title="File Four" type="file"/>
			</sjt:treeItem>
			<sjt:treeItem title="File Three" type="file"/>
		</sjt:treeItem>
	</sjt:treeItem>
</sjt:tree>

<div class="code ui-widget-content ui-corner-all">
	<strong>Code:</strong>
    <pre>
&lt;h2&gt;Static Tree&lt;/h2&gt;

&lt;p class=&quot;text&quot;&gt;
	A simple static Tree Component.
&lt;/p&gt;
&lt;sjt:tree id=&quot;treeStatic&quot; jstreetheme=&quot;default&quot; openAllOnLoad=&quot;true&quot;&gt;
	&lt;sjt:treeItem title=&quot;Struts2&quot;&gt;
		&lt;sjt:treeItem title=&quot;General&quot;&gt;
			&lt;sjt:treeItem title=&quot;Struts2&quot; href=&quot;http://struts.apache.org/2.x/index.html&quot;/&gt;
			&lt;sjt:treeItem title=&quot;Struts2 @ Facebook&quot;
			              href=&quot;http://www.facebook.com/pages/Struts2-Users/103890046351798&quot;/&gt;
		&lt;/sjt:treeItem&gt;
		&lt;sjt:treeItem title=&quot;Plugins&quot;&gt;
			&lt;sjt:treeItem title=&quot;Struts2 Plugins&quot; href=&quot;https://cwiki.apache.org/S2PLUGINS/home.html&quot;/&gt;
			&lt;sjt:treeItem title=&quot;Struts2 jQuery Plugin&quot; href=&quot;http://code.google.com/p/struts2-jquery/&quot;/&gt;
			&lt;sjt:treeItem title=&quot;Struts2 Full Hibernate Plugin&quot;
			              href=&quot;http://code.google.com/p/full-hibernate-plugin-for-struts2/&quot;/&gt;
		&lt;/sjt:treeItem&gt;
		&lt;sjt:treeItem title=&quot;Blogs&quot;&gt;
			&lt;sjt:treeItem title=&quot;Struts2 jQuery News&quot; href=&quot;http://www.jgeppert.com/category/java/struts2-jquery/&quot;/&gt;
		&lt;/sjt:treeItem&gt;
		&lt;sjt:treeItem title=&quot;AJAX Links&quot;&gt;
			&lt;s:url var=&quot;ajax1&quot; value=&quot;/ajax1.action&quot;/&gt;
			&lt;sjt:treeItem title=&quot;Ajax 1&quot; href=&quot;%{ajax1}&quot; targets=&quot;result&quot;/&gt;
			&lt;s:url var=&quot;ajax2&quot; value=&quot;/ajax2.action&quot;/&gt;
			&lt;sjt:treeItem title=&quot;Ajax 2&quot; href=&quot;%{ajax2}&quot; targets=&quot;result&quot; effect=&quot;highlight&quot; effectDuration=&quot;2500&quot;/&gt;
			&lt;s:url var=&quot;ajax3&quot; value=&quot;/ajax3.action&quot;/&gt;
			&lt;sjt:treeItem title=&quot;Ajax 3&quot; href=&quot;%{ajax3}&quot; targets=&quot;result&quot; onBeforeTopics=&quot;beforeLink&quot;
			              onCompleteTopics=&quot;completeLink&quot;/&gt;
			&lt;s:url var=&quot;ajax4&quot; value=&quot;/ajax4.action&quot;/&gt;
			&lt;sjt:treeItem title=&quot;Ajax 4&quot; href=&quot;%{ajax4}&quot; targets=&quot;result&quot; effect=&quot;bounce&quot; effectDuration=&quot;1000&quot;/&gt;
		&lt;/sjt:treeItem&gt;
	&lt;/sjt:treeItem&gt;
&lt;/sjt:tree&gt;

&lt;strong&gt;Result Div :&lt;/strong&gt;

&lt;div id=&quot;result&quot; class=&quot;result ui-widget-content ui-corner-all&quot;&gt;Click on the AJAX Links above.&lt;/div&gt;


&lt;h2&gt;Dynamic Tree with AJAX Links and Contextmenu&lt;/h2&gt;

&lt;p class=&quot;text&quot;&gt;
	A Tree Component rendered on the server with AJAX Links and Contextmenu.
&lt;/p&gt;
&lt;s:url var=&quot;echo&quot; value=&quot;/echo.action&quot;/&gt;
&lt;sjt:tree
		id=&quot;treeDynamicAjax&quot;
		rootNode=&quot;nodes&quot;
		childCollectionProperty=&quot;children&quot;
		nodeTitleProperty=&quot;text&quot;
		nodeIdProperty=&quot;id&quot;
		nodeHref=&quot;%{echo}&quot;
		nodeHrefParamName=&quot;echo&quot;
		nodeTargets=&quot;result2&quot;
		contextmenu=&quot;{
    			items: {
    				'create' : false,
    				'rename' : false,
    				'ccp' : false,
    				'remove' : {
    					'label': 'Delete this Node',
    					'action':  function (obj) {
    					    var ref = $('#treeDynamicAjax').jstree(true),
							    sel = ref.get_selected();
							if(!sel.length) { return false; }
							deleteTreeNode('%{echo}', sel);
							ref.delete_node(sel);
						}
    				}
    			}
    		}&quot;
		/&gt;

&lt;strong&gt;Result Div :&lt;/strong&gt;

&lt;div id=&quot;result2&quot; class=&quot;result ui-widget-content ui-corner-all&quot;&gt;Click on the AJAX Links above.&lt;/div&gt;

&lt;h2&gt;Dynamic Tree in form with Checkboxes&lt;/h2&gt;

&lt;p class=&quot;text&quot;&gt;
	A Tree Component in a form with Checkboxes.
&lt;/p&gt;
&lt;s:form id=&quot;treeForm&quot; action=&quot;echo&quot; theme=&quot;simple&quot;&gt;
	&lt;sjt:tree
			name=&quot;echo&quot;
			id=&quot;treeDynamicCheckboxes&quot;
			rootNode=&quot;nodes&quot;
			childCollectionProperty=&quot;children&quot;
			nodeTitleProperty=&quot;text&quot;
			nodeIdProperty=&quot;id&quot;
			openAllOnLoad=&quot;true&quot;
			checkbox=&quot;true&quot;
			checkboxToogleAllTopics=&quot;toogleAllNodesTopic&quot;
			checkboxShowTopics=&quot;showCheckboxesTopic&quot;
			checkboxHideTopics=&quot;hideCheckboxesTopic&quot;
			onClickTopics=&quot;treeClicked&quot;
            showThemeDots=&quot;false&quot;
            showThemeIcons=&quot;false&quot;
			/&gt;
	&lt;sj:submit formIds=&quot;treeForm&quot; targets=&quot;result3&quot; button=&quot;true&quot;/&gt;
	&lt;sj:submit onClickTopics=&quot;toogleAllNodesTopic&quot; value=&quot;Toogle all Nodes&quot; button=&quot;true&quot;/&gt;
	&lt;sj:submit onClickTopics=&quot;showCheckboxesTopic&quot; value=&quot;Show Checkboxes&quot; button=&quot;true&quot;/&gt;
	&lt;sj:submit onClickTopics=&quot;hideCheckboxesTopic&quot; value=&quot;Hide Checkboxes&quot; button=&quot;true&quot;/&gt;
&lt;/s:form&gt;
&lt;strong&gt;Result Div :&lt;/strong&gt;

&lt;div id=&quot;result3&quot; class=&quot;result ui-widget-content ui-corner-all&quot;&gt;Click on the AJAX Submit above.&lt;/div&gt;


&lt;h2&gt;Tree with Types&lt;/h2&gt;

&lt;p class=&quot;text&quot;&gt;
	A Tree with different node types.
&lt;/p&gt;
&lt;s:set id=&quot;contextPath&quot; value=&quot;#request.get('javax.servlet.forward.context_path')&quot;/&gt;
&lt;sjt:tree
		id=&quot;treeTypes&quot;
		jstreetheme=&quot;default&quot;
		openAllOnLoad=&quot;true&quot;
		types=&quot;{
            'root' : {
                'max_children' : 1,
                'max_depth' : 4,
                'icon' : '%{contextPath}/images/root.png',
                'valid_children' : [ 'folder', 'file' ]
            },
            'folder' : {
                'icon' : '%{contextPath}/images/folder.png',
                'valid_children' : [ 'folder', 'file' ]
            },
            'file' : {
                'icon' : '%{contextPath}/images/file.png',
                'valid_children' : [ ]
            }
		}&quot;&gt;
	&lt;sjt:treeItem title=&quot;Root&quot; type=&quot;root&quot;&gt;
		&lt;sjt:treeItem title=&quot;Folder One&quot; type=&quot;folder&quot;&gt;
			&lt;sjt:treeItem title=&quot;File One&quot; type=&quot;file&quot;/&gt;
			&lt;sjt:treeItem title=&quot;File Two&quot; type=&quot;file&quot;/&gt;
		&lt;/sjt:treeItem&gt;
		&lt;sjt:treeItem title=&quot;Folder Two&quot; type=&quot;folder&quot;&gt;
			&lt;sjt:treeItem title=&quot;Folder Three&quot; type=&quot;folder&quot;&gt;
				&lt;sjt:treeItem title=&quot;File Four&quot; type=&quot;file&quot;/&gt;
			&lt;/sjt:treeItem&gt;
			&lt;sjt:treeItem title=&quot;File Three&quot; type=&quot;file&quot;/&gt;
		&lt;/sjt:treeItem&gt;
	&lt;/sjt:treeItem&gt;
&lt;/sjt:tree&gt;

    </pre>
</div>
