Given the following Redux (or useReducer) reducer function
import * from './thunks'

<span class="hljs-keyword">const</span> defaultState = {
  <span class="hljs-attr">authenticated</span>: <span class="hljs-literal">false</span>,
  <span class="hljs-attr">loading</span>: <span class="hljs-literal">false</span>,
};

<span class="hljs-keyword">function</span> <span class="hljs-title function_">authReducer</span>(<span class="hljs-params">state = defaultState, action</span>) {
  <span class="hljs-keyword">if</span> (action.<span class="hljs-property">type</span> === <span class="hljs-string">'auth/LOGIN'</span>) {
    <span class="hljs-variable language_">localStorage</span>.<span class="hljs-title function_">setItem</span>(<span class="hljs-string">'auth_token'</span>, action.<span class="hljs-property">payload</span>);
    state.<span class="hljs-property">authenticated</span>= <span class="hljs-literal">true</span>;
  }

  <span class="hljs-keyword">if</span> (action.<span class="hljs-property">type</span> === <span class="hljs-string">'auth/LOGOUT'</span>) {
    <span class="hljs-variable language_">localStorage</span>.<span class="hljs-title function_">removeItem</span>(<span class="hljs-string">'auth_token'</span>);
    state.<span class="hljs-property">authenticated</span>: <span class="hljs-literal">false</span>;
  }

  <span class="hljs-keyword">return</span> state;
}
</code></pre>
<p>What will happen when the <strong>Sign In</strong> button from the component below is clicked?</p>
<pre><code class="language-jsx"><span class="hljs-keyword">import</span> <span class="hljs-title class_">AccountService</span> <span class="hljs-keyword">from</span> <span class="hljs-string">'./account.service'</span>;

<span class="hljs-keyword">const</span> <span class="hljs-title function_">LoginForm</span> = (<span class="hljs-params"></span>) =&gt; {
  <span class="hljs-keyword">const</span> form = <span class="hljs-title class_">React</span>.<span class="hljs-title function_">useRef</span>();
  <span class="hljs-keyword">const</span> dispatch = <span class="hljs-title function_">useDispatch</span>();
  <span class="hljs-keyword">const</span> history = <span class="hljs-title function_">useHistory</span>();
  <span class="hljs-keyword">const</span> authenticated = <span class="hljs-title function_">useSelector</span>(<span class="hljs-function">(<span class="hljs-params">store</span>) =&gt;</span> store.<span class="hljs-property">authenticated</span>);

  <span class="hljs-keyword">const</span> <span class="hljs-title function_">handleClick</span> = <span class="hljs-keyword">async</span> (<span class="hljs-params"></span>) =&gt; {
    <span class="hljs-keyword">const</span> token = <span class="hljs-keyword">await</span> <span class="hljs-title class_">AccountService</span>.<span class="hljs-title function_">login</span>({
      <span class="hljs-attr">username</span>: form.<span class="hljs-title function_">getElementById</span>(<span class="hljs-string">'username'</span>).<span class="hljs-property">value</span>,
      <span class="hljs-attr">password</span>: form.<span class="hljs-title function_">getElementById</span>(<span class="hljs-string">'password'</span>).<span class="hljs-property">value</span>,
    });
    
    <span class="hljs-title function_">dispatch</span>({
      <span class="hljs-attr">type</span>: <span class="hljs-string">'auth/LOGIN'</span>,
      <span class="hljs-attr">payload</span>: token,
    });
  };

  <span class="hljs-title class_">React</span>.<span class="hljs-title function_">useEffect</span>(<span class="hljs-function">() =&gt;</span> {
    <span class="hljs-keyword">if</span> (authenticated) history.<span class="hljs-title function_">push</span>(<span class="hljs-string">'/home'</span>);
  }, [authenticated]);

  <span class="hljs-keyword">return</span> (
    <span class="language-xml"><span class="hljs-tag">&lt;<span class="hljs-name">form</span> <span class="hljs-attr">ref</span>=<span class="hljs-string">{form}</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-name">input</span> <span class="hljs-attr">id</span>=<span class="hljs-string">"username"</span> <span class="hljs-attr">type</span>=<span class="hljs-string">"text"</span> /&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-name">input</span> <span class="hljs-attr">id</span>=<span class="hljs-string">"password"</span> <span class="hljs-attr">type</span>=<span class="hljs-string">"password"</span> /&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-name">button</span> <span class="hljs-attr">onClick</span>=<span class="hljs-string">{handleClick}</span>&gt;</span>Sign In<span class="hljs-tag">&lt;/<span class="hljs-name">button</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">form</span>&gt;</span></span>
  );
};
</code></pre>
</div>