# Copyright 2024 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Implementation of the cc_sysroot macro."""

load("//cc/toolchains:args.bzl", "cc_args")

visibility("public")

def cc_sysroot(name, sysroot, **kwargs):
    """Creates args for a sysroot.

    Args:
      name: (str) The name of the target
      sysroot: (bazel_skylib's directory rule) The directory that should be the
        sysroot.
      **kwargs: kwargs to pass to cc_args.
    """
    cc_args(
        name = name,
        actions = [
            "//cc/toolchains/actions:cpp_compile_actions",
            "//cc/toolchains/actions:c_compile",
            "//cc/toolchains/actions:link_actions",
        ],
        args = ["--sysroot={sysroot}"],
        format = {"sysroot": sysroot},
        **kwargs
    )