// require requirements used below
const path = require('path');
const webpack = require('webpack');
const OwlResolver = require('opal-webpack-loader/resolver'); // to resolve ruby files
const ExtraWatchWebpackPlugin = require('extra-watch-webpack-plugin'); // to watch for added ruby files

const common_config = {
    context: path.resolve(__dirname, '../isomorfeus'),
    mode: "development",
    optimization: {
        removeAvailableModules: false,
        removeEmptyChunks: false,
        minimize: false // dont minimize in development, to speed up hot reloads
    },
    performance: {
        maxAssetSize: 20000000,
        maxEntrypointSize: 20000000
    },
    output: {
        // webpack-dev-server keeps the output in memory
        filename: '[name].js',
        path: path.resolve(__dirname, '../public/assets'),
        publicPath: 'http://localhost:3035/assets/'
    },
    resolve: {
        plugins: [
            // this makes it possible for webpack to find ruby files
            new OwlResolver('resolve', 'resolved')
        ]
    },
    module: {
        rules: [
            {
                // loader for .scss files
                // test means "test for for file endings"
                test: /.scss$/,
                use: [ "style-loader", "css-loader",
                    {
                        loader: "sass-loader",
                        options: { includePaths: [path.resolve(__dirname, '../isomorfeus/styles')] }
                    }
                ]
            },
            {
                // loader for .css files
                test: /.css$/,
                use: [ "style-loader", "css-loader" ]
            },
            {
                test: /.(png|svg|jpg|gif|woff|woff2|eot|ttf|otf)$/,
                use: [ "file-loader" ]
            },
            {
                // opal-webpack-loader will compile and include ruby files in the pack
                test: /.(rb|js.rb)$/,
                use: [
                    {
                        loader: 'opal-webpack-loader',
                        options: {
                            sourceMap: false,
                            hmr: true,
                            hmrHook: 'Opal.Isomorfeus.$force_render()'
                        }
                    }
                ]
            }
        ]
    },
    // configuration for webpack-dev-server
    devServer: {
        open: false,
        lazy: false,
        port: 3035,
        hot: true,
        // hotOnly: true,
        inline: true,
        https: false,
        disableHostCheck: true,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
            "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization"
        },
        watchOptions: {
            // in case of problems with hot reloading uncomment the following two lines:
            // aggregateTimeout: 250,
            // poll: 50,
            ignored: /\bnode_modules\b/
        },
        contentBase: path.resolve(__dirname, 'public'),
        useLocalIp: false
    }
};

const browser_config = {
    target: 'web',
    plugins: [
        // both for hot reloading
        new webpack.NamedModulesPlugin(),
        new webpack.HotModuleReplacementPlugin(),
        // watch for added files in opal dir
        new ExtraWatchWebpackPlugin({ dirs: [ path.resolve(__dirname, '../isomorfeus') ] }),
        new webpack.DefinePlugin({
            OPAL_DEVTOOLS_OBJECT_REGISTRY: true
        })
    ],
    entry: { application: [path.resolve(__dirname, '../isomorfeus/imports/application_debug.js')] }
};

const browser_debug_guide_config = {
    target: 'web',
    plugins: [
        // both for hot reloading
        new webpack.NamedModulesPlugin(),
        new webpack.HotModuleReplacementPlugin(),
        // watch for added files in opal dir
        new ExtraWatchWebpackPlugin({ dirs: [ path.resolve(__dirname, '../isomorfeus') ] }),
        new webpack.DefinePlugin({
            OPAL_DEVTOOLS_OBJECT_REGISTRY: true
        })
    ],
    entry: { application_debug_guide: [path.resolve(__dirname, '../isomorfeus/imports/application_debug_guide.js')] }
};

const ssr_config = {
    target: 'node',
    plugins: [
        // dont split ssr asset in chunks
        new webpack.optimize.LimitChunkCountPlugin({ maxChunks: 1 }),
        // both for hot reloading
        // new webpack.NamedModulesPlugin(),
        // new webpack.HotModuleReplacementPlugin(),
        // watch for added files in opal dir
        new ExtraWatchWebpackPlugin({ dirs: [ path.resolve(__dirname, '../isomorfeus') ] }),
        new webpack.DefinePlugin({
            OPAL_DEVTOOLS_OBJECT_REGISTRY: true
        })
    ],
    entry: { application_ssr: [path.resolve(__dirname, '../isomorfeus/imports/application_ssr.js')] }
};

// const web_worker_config = {
//     target: 'webworker',
//     entry: { web_worker: [path.resolve(__dirname, '../isomorfeus/imports/application_web_worker.js')] }
// };

const browser = Object.assign({}, common_config, browser_config);
const browser_debug_guide = Object.assign({}, common_config, browser_debug_guide_config);
const ssr = Object.assign({}, common_config, ssr_config);
// const web_worker = Object.assign({}, common_config, web_worker_config);

module.exports = [ browser, browser_debug_guide, ssr ];
