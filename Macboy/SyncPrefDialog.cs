using System;
using System.Collections.Generic;
using System.Linq;
using MonoMac.Foundation;
using MonoMac.AppKit;

namespace Tomboy
{
    public partial class SyncPrefDialog : MonoMac.AppKit.NSWindow
    {

        #region Constructors

        // Called when created from unmanaged code
        public SyncPrefDialog(IntPtr handle) : base (handle)
        {
            Initialize();
        }
        // Called when created directly from a XIB file
        [Export("initWithCoder:")]
        public SyncPrefDialog(NSCoder coder) : base (coder)
        {
            Initialize();
        }
        // Shared initialization code
        void Initialize()
        {
        }

        #endregion

    }
}

