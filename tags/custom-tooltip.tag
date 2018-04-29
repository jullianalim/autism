<custom-tooltip>

	    <input type="text" ref="comment">
      <p>Observation Comments: { opts.message}</p>
 <!-- <p>Y Value: { opts.tooltipData.yLabel }</p>
	<p>blah { opts.x }</p> -->

	<button onclick={doSomething }>Comment</button>

	<script>
		var that = this;
		console.log('custom-tooltip.tag');
		var commentRef = rootRef.child('/comments');

		doSomething(e) {
			<!-- var comment= this.refs.comment.value; -->
			var key = commentRef.push().key;
			var comment = {
				id:key,
				message: this.refs.comment.value
			};

			commentRef.child(key).set(comment);

			//alert(JSON.stringify(this.opts.tooltipData));
		}
	</script>

	<style>
		:scope {
			display: inline-block;
			background-color: dodgerblue;
			color: white;
			border-radius: 0.25em;
			padding: 0.25em;
		}
	</style>
</custom-tooltip>
