// Author:
//       Jared Jennings <jjennings@gnome.org>
//       Jérémie Laval <jeremie.laval@gmail.com>
//
// Copyright (c) 2012 Jared Jennings 2012
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

using System;
using System.Collections.Generic;
using System.Linq;
using MonoMac.Foundation;
using MonoMac.AppKit;

namespace Tomboy
{
	public partial class ShowNotesPopup : MonoMac.AppKit.NSView
	{
		public ShowNotesPopup (IntPtr handle) : base (handle)
		{
			Initialize ();
		}
		
		[Export ("initWithCoder:")]
		public ShowNotesPopup (NSCoder coder) : base (coder)
		{
			Initialize ();
		}
		
		void Initialize ()
		{
		}

		partial void ColumnNumberSliderChange (MonoMac.AppKit.NSSlider sender)
		{
			Console.WriteLine ("SliderChange {0}", sender.IntValue);
			((NoteCollectionView)CollectionView).UpdateColumnCountBasedOnNumber (sender.IntValue);
		}

		public NoteCollectionView CollectionView {
			get {
				return collectionView;
			}
		}
	}
}
