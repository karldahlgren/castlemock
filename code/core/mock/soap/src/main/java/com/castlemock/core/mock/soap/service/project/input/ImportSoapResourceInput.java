/*
 * Copyright 2018 Karl Dahlgren
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.castlemock.core.mock.soap.service.project.input;

import com.castlemock.core.basis.model.Input;
import com.castlemock.core.basis.model.validation.NotNull;
import com.castlemock.core.mock.soap.model.project.domain.SoapResource;

/**
 * @author Karl Dahlgren
 * @since 1.19
 */
public final class ImportSoapResourceInput implements Input {

    private final String projectId;
    @NotNull
    private final SoapResource resource;
    @NotNull
    private final String raw;

    public ImportSoapResourceInput(final String projectId,
                                   final SoapResource resource,
                                   final String raw) {
        this.projectId = projectId;
        this.resource = resource;
        this.raw = raw;
    }

    public String getProjectId() {
        return projectId;
    }

    public SoapResource getResource() {
        return resource;
    }

    public String getRaw() {
        return raw;
    }

}
