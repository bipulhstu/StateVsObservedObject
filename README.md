<h2>In SwiftUI, @StateObject and @ObservedObject are both used to manage observable objects, but they behave differently in terms of lifecycle and ownership</h2>

<h3>@StateObject (Recommended for creating ViewModel)</h3>
<ul> <li>SwiftUI owns and manages the lifecycle of the object</li>
<li>The instance persists even when the view is recreated</li>
<li>Ideal for creating the ViewModel inside a view</li>
</ul>
<br>
<h3>@ObservedObject (For injecting existing ViewModel)</h3>
<li>The view does not own the object; it depends on an extenal source</li>
<li>When the view is recreated, a new instance is created, resetting state</li>
<li>Ideal for passing an already created object from a parent</li>
