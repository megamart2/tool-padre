/*******************************************************************************
 * Copyright (c) 2008 The University of York.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * 
 * Contributors:
 *     Dimitrios Kolovos - initial API and implementation
 ******************************************************************************/
package org.eclipse.epsilon.epl.dt;

import org.eclipse.epsilon.common.dt.AbstractEpsilonUIPlugin;

public class EplPlugin extends AbstractEpsilonUIPlugin {
	
	public static EplPlugin getDefault() {
	     return (EplPlugin) plugins.get(EplPlugin.class);
	}

}
