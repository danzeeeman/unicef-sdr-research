// This is the SIP specification of the QPyDBusPendingReply class.
//
// Copyright (c) 2013 Riverbank Computing Limited <info@riverbankcomputing.com>
// 
// This file is part of PyQt.
// 
// This file may be used under the terms of the GNU General Public
// License versions 2.0 or 3.0 as published by the Free Software
// Foundation and appearing in the files LICENSE.GPL2 and LICENSE.GPL3
// included in the packaging of this file.  Alternatively you may (at
// your option) use any later version of the GNU General Public
// License if such license has been publicly approved by Riverbank
// Computing Limited (or its successors, if any) and the KDE Free Qt
// Foundation. In addition, as a special exception, Riverbank gives you
// certain additional rights. These rights are described in the Riverbank
// GPL Exception version 1.1, which can be found in the file
// GPL_EXCEPTION.txt in this package.
// 
// If you are unsure which license is appropriate for your use, please
// contact the sales department at sales@riverbankcomputing.com.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


%If (Qt_4_7_0 -)

class QPyDBusPendingReply : QDBusPendingCall /PyName=QDBusPendingReply/
{
%TypeHeaderCode
#include <qpydbuspendingreply.h>
%End

public:
    QPyDBusPendingReply();
    QPyDBusPendingReply(const QPyDBusPendingReply &other);
    QPyDBusPendingReply(const QDBusPendingCall &call);
    QPyDBusPendingReply(const QDBusMessage &reply);

    // The /ReleaseGIL/ annotation is needed because QDBusPendingCall has an
    // internal mutex.
    QVariant argumentAt(int index) const /ReleaseGIL/;
    QDBusError error() const /ReleaseGIL/;
    bool isError() const /ReleaseGIL/;
    bool isFinished() const /ReleaseGIL/;
    bool isValid() const /ReleaseGIL/;
    QDBusMessage reply() const /ReleaseGIL/;
    void waitForFinished() /ReleaseGIL/;

    SIP_PYOBJECT value(SIP_PYOBJECT type /DocValue="None"/ = 0) const /HoldGIL/;
};

%End
